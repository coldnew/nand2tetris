EMACS ?= emacs
PWD := $(shell pwd)

SRC_DIR := ${PWD}
DST_DIR := ${PWD}/public/

all: compile

clean:
	$(RM) -rf public

compile:
	${EMACS} -Q --script "elisp/publish.el"

.PHONY: all
