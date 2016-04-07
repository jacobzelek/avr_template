build:
	avr-gcc -g -Os -mmcu=atmega32 -c main.c
	avr-gcc -g -mmcu=atmega32 -o main.elf main.o
	avr-objcopy -j .text -j .data -O ihex main.elf main.hex

install:
	avrdude -c usbtiny -p atmega328p -U flash:w:main.hex

clean:
	rm main.elf
	rm main.hex