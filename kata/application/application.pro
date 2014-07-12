TEMPLATE = lib

CONFIG += staticlib
CONFIG -= qt

INCLUDEPATH += include

SOURCES += \
    source/application.cc

HEADERS += \
    include/application.h

include(../common.pri)

# avr build
#   QMAKE_EXTRA_COMPILERS
# or
#   QMAKE_EXTRA_TARGETS
