TEMPLATE = app

CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
    main.cc

include(../common.pri)
include(../application/application.pri)

# AVR compilation

AVR_SOURCES = SOURCES
AVR_INCLUDES = $$join(INCLUDEPATH,'" -I "','-I "','"')

include(../avr_elf.pri)

