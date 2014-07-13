INCLUDEPATH += $$PWD/../application/include
DEPENDPATH += $$PWD/../application/include

PRE_TARGETDEPS += $$OUT_PWD/../application/libapplication.a

LIBS += -L$$OUT_PWD/../application
LIBS += -lapplication

AVR_PRE_TARGETDEPS += $$OUT_PWD/../application/libapplication_avr.a
AVR_LIBS = -L$$OUT_PWD/../application/ -lapplication_avr

