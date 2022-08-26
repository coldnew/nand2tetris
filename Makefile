all: publish projects01

publish:
	make -C notes

projects01:
	make -C projects/01

.PHONY: all
