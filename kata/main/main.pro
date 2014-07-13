TEMPLATE = app

CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
    main.cc

AVR_SOURCES = SOURCES
AVR_INCLUDES = $$join(INCLUDEPATH,'" -I "','-I "','"')

include(../common.pri)
include(../application/application.pri)
include(../avr_elf.pri)
