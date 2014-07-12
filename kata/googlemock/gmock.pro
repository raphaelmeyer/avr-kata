TEMPLATE = lib

CONFIG += staticlib warn_off
CONFIG -= qt

INCLUDEPATH += include

SOURCES += gmock-gtest-all.cc

HEADERS += \
  include/gmock/gmock.h \
  include/gtest/gtest.h

include(../common.pri)

