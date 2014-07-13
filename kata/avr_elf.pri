AVR_F_CPU = 1000000
AVR_MCU = atmega168

avr_gcc.input = $$AVR_SOURCES
avr_gcc.output = ${QMAKE_FILE_BASE}.avr.o
avr_gcc.commands = avr-g++ -mmcu=$$AVR_MCU -Os -DF_CPU=$$AVR_F_CPU $$AVR_INCLUDES -c ${QMAKE_FILE_NAME} -o ${QMAKE_FILE_OUT}
avr_gcc.depend_commands = avr-g++ -mmcu=$$AVR_MCU -E -M ${QMAKE_FILE_NAME} | sed "s,^.*: ,,"
avr_gcc.variable_out = AVR_OBJECTS
avr_gcc.CONFIG += no_link

QMAKE_EXTRA_COMPILERS += avr_gcc

avr_elf.input = AVR_OBJECTS
avr_elf.output = $${TARGET}.elf
avr_elf.commands = avr-g++ -mmcu=$$AVR_MCU -Os -DF_CPU=$$AVR_F_CPU -o ${QMAKE_FILE_OUT} ${QMAKE_FILE_IN} $$AVR_LIBS
avr_elf.depends = $$AVR_PRE_TARGETDEPS
avr_elf.variable_out = AVR_ELF
avr_elf.CONFIG += no_link combine

QMAKE_EXTRA_COMPILERS += avr_elf

avr_hex.input = AVR_ELF
avr_hex.output = $${TARGET}.hex
avr_hex.commands = objcopy -j .text -j .data -O ihex ${QMAKE_FILE_NAME} ${QMAKE_FILE_OUT}
avr_hex.CONFIG += no_link target_predeps

QMAKE_EXTRA_COMPILERS += avr_hex

