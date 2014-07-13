TEMPLATE = lib

CONFIG += staticlib
CONFIG -= qt

INCLUDEPATH += $$PWD/include

SOURCES += \
    source/application.cc

HEADERS += \
    include/application.h

AVR_SOURCES = SOURCES
AVR_INCLUDES = $$join(INCLUDEPATH,'" -I "','-I "','"')

include(../common.pri)
include(../avr_lib.pri)

