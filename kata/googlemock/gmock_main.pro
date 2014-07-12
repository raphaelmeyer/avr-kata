TEMPLATE = lib

CONFIG += staticlib warn_off
CONFIG -= qt

INCLUDEPATH += include

SOURCES += gmock_main.cc

include(../common.pri)

