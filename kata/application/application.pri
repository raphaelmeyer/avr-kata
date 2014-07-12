INCLUDEPATH += $$PWD/../application/include
DEPENDPATH += $$PWD/../application/include

PRE_TARGETDEPS += $$OUT_PWD/../application/libapplication.a

LIBS += -L$$OUT_PWD/../application
LIBS += -lapplication

