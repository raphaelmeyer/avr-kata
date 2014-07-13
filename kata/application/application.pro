TEMPLATE = lib

CONFIG += staticlib
CONFIG -= qt

INCLUDEPATH += $$PWD/include

SOURCES += \
    source/application.cc

HEADERS += \
    include/application.h

include(../common.pri)

# AVR compilation

AVR_SOURCES = SOURCES
AVR_INCLUDES = $$join(INCLUDEPATH,'" -I "','-I "','"')

include(../avr_lib.pri)

