QT        += core gui
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
CONFIG    += c++11
SOURCES   += $$files("*.cpp", false)
HEADERS   += $$files("*.h",   false)
FORMS     += $$files("*.ui",  false)
RESOURCES += $$files("*.qrc", false)
LIBS      += -L$$PWD/lib/*
