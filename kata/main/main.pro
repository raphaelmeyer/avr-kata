TEMPLATE = app

CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
    main.cc

include(../common.pri)
include(../application/application.pri)

AVR_SOURCES = SOURCES
AVR_INCLUDES = $$join(INCLUDEPATH,'" -I "','-I "','"')
AVR_LIBS = -L$$OUT_PWD/../application/ -lapplication_avr

include(../common.pri)
include(../avr_elf.pri)
