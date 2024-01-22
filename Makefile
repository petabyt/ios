.PHONY: all clean

DARLING := darling shell
APP_DIR := Untitled.app
XCODE ?= /Volumes/SystemRoot/home/daniel/Downloads/Xcode.app
SYSROOT ?= $(XCODE)/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator13.0.sdk

APP_REQ := $(addprefix $(APP_DIR)/,main Info.plist)
all: $(APP_REQ)
$(APP_REQ): | $(APP_DIR)

emu:
	make
	make -f emu.mk

CFLAGS := $(ARCHS) -isysroot $(SYSROOT)
LDFLAGS := -framework Foundation -framework UIKit -lobjc
OBJ := main.o test.o

MAC := /Volumes/SystemRoot/home/daniel/Downloads/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk

$(APP_DIR)/main: $(OBJ)
	$(DARLING) clang $(CFLAGS) $(LDFLAGS) -o $@ $<

%.o: %.m
	$(DARLING) clang -c $< $(CFLAGS) -o $@

%.o: %.c
	$(DARLING) clang -c $< $(CFLAGS) -o $@

$(APP_DIR)/Info.plist:
	./plist.py $(APP_DIR)/Info.plist

$(APP_DIR):
	mkdir -p $(APP_DIR)

clean:
	rm -rf Untitled.app Info.plist *.zip *.o

