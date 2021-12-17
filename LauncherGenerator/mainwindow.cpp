#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QFile>
#include <QString>
#include <QFileInfo>
#include <QFileDialog>
#include <QDebug>
#include <QProcess>

MainWindow::MainWindow(QWidget *parent) : QMainWindow(parent), ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    m_icon    = "/opt/LauncherGenerator/rocket.ico";
    m_version = "v3.0";

    showIcon(m_icon);
    ui->checkUpdates->setText(m_version);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::showIcon(QString path)
{
    QIcon icon = QIcon(path);
    ui->buttonSelectIcon->setIcon(icon);
    ui->buttonSelectIcon->setText("");
}

bool MainWindow::isTextBoxesEmpty()
{
    if(ui->textLauncherName->text().isEmpty())  return true;
    if(ui->textCommand->text().isEmpty())       return true;

    return false;
}

QString MainWindow::createCommand(QString path)
{
    QString cmd;
    QFileInfo info(path);

    if(!(info.suffix() == "sh") && !(info.suffix() == ""))
        cmd.append("xdg-open ");

    path = closeWithApostrophe(path);

    cmd.append(path.toLocal8Bit());

    return cmd;
}

QString MainWindow::closeWithApostrophe(QString oldString)
{
    QString newString;
    newString.append("'" + oldString + "'");
    return newString;
}

QByteArray MainWindow::createLauncherContent()
{
    QByteArray content;

    content.append("#!/usr/bin/env xdg-open\n\n");
    content.append("[Desktop Entry]\n");
    content.append("Name=" + m_launcherName.toLocal8Bit() + "\n");
    content.append("StartupNotify=true\n");

    if(m_willTerminalOpen) content.append("Terminal=true\n");
    else                   content.append("Terminal=false\n");

    content.append("Type=Application\n");
    content.append("Icon=" + m_icon.toLocal8Bit() + "\n");
    content.append("Exec=sh -c \"" + m_command.toLocal8Bit() + "\" %F");

    return content;
}

QFile* MainWindow::createFileOnDesktop(QString fileName, QByteArray content)
{
    QString path = "/home/" + qgetenv("USER")+"/Desktop/" + fileName;

    QFile *f;
    f = new QFile(path);

    if(f->exists())
        return NULL;

    f->open(QIODevice::WriteOnly);
    f->write(content);
    f->close();
    return f;
}

void MainWindow::convertExecutableFile(QFile *f)
{
    QFileInfo info(f->fileName());
    QString cmd = "chmod +x " + info.filePath();
    QProcess::execute(cmd);
}

void MainWindow::checkUpdates()
{
    // TODO: check and download new version if available
}

void MainWindow::on_buttonBox_accepted()
{
    if(isTextBoxesEmpty())
        return;

    m_launcherName     = ui->textLauncherName->text();
    m_command          = ui->textCommand->text();
    m_willTerminalOpen = ui->checkTerminal->isChecked();

    QString fileName = m_launcherName + ".desktop";
    fileName.replace(" ", "_");

    QFile *file;
    file = createFileOnDesktop(fileName, createLauncherContent());

    if(!file)
    {
        ui->textLauncherName->clear();
        return;
    }

    convertExecutableFile(file);
    this->close();
}


void MainWindow::on_buttonBox_rejected()
{
    this->close();
}

void MainWindow::on_buttonSelectIcon_clicked()
{
    QString path = QFileDialog::getOpenFileName(this, "Select an icon", "/home/");

    if(path.isEmpty())
        return;

    m_icon = path;
    showIcon(path);
}

void MainWindow::on_buttonBrowse_clicked()
{
    QString path = QFileDialog::getOpenFileName(this, "Select an executable file", "/home/");

    if(path.isEmpty())
        return;

    m_command = createCommand(path);
    ui->textCommand->setText(m_command);
}

void MainWindow::on_checkUpdates_clicked()
{
    checkUpdates();
}

