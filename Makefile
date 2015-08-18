CFLAGS?=-O2 -g -Wall -W $(shell pkg-config --cflags librtlsdr)
LDLIBS+=$(shell pkg-config --libs librtlsdr) -lpthread -lm
CC?=gcc
PROGNAME=rtl_acars_ng

all: rtl_acars_ng

%.o: %.c
	$(CC) $(CFLAGS) -c $<

rtl_acars_ng: rtl_acars_ng.o 
	$(CC) -g -o rtl_acars_ng rtl_acars_ng.o $(LDFLAGS) $(LDLIBS)

clean:
	rm -f *.o rtl_acars_ng
