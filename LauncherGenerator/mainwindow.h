#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class QString;
class QFile;

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = NULL);
    ~MainWindow();

private:
    void        showIcon(QString path);
    bool        isTextBoxesEmpty();
    QString     createCommand(QString path);
    QString     closeWithApostrophe(QString oldString);
    QByteArray  createLauncherContent();
    QFile       *createFileOnDesktop(QString fileName, QByteArray content);
    void        convertExecutableFile(QFile *f);
    void        checkUpdates();

private slots:
    void        on_buttonBox_accepted();
    void        on_buttonBox_rejected();
    void        on_buttonSelectIcon_clicked();
    void        on_buttonBrowse_clicked();

    void on_checkUpdates_clicked();

private:
    Ui::MainWindow *ui;

    QString     m_launcherName;
    QString     m_command;
    QString     m_icon;
    bool        m_willTerminalOpen;
    QString     m_version;
};
#endif // MAINWINDOW_H
