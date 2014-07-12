TEMPLATE = app

CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
    main.cc

include(../common.pri)
include(../application/application.pri)

