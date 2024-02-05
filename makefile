.ONESHELL:

ISO_DIR := ~/iso
ISO_NAME := $(shell ls -t $(ISO_DIR)/*.iso | head -n 1)

make:
	mkarchiso -v -w build -o $(ISO_DIR) archlive/

install: make
	@echo "Please enter the drive to write the ISO (e.g., /dev/sdX):"
	@read drive; \
	sudo dd if=$(ISO_NAME) of=$$drive bs=4M

clean:
	rm -rf build/*
