# Using Makefiles in Python
# https://krzysztofzuraw.com/blog/2016/makefiles-in-python-projects.html

# Listing targets in the Makefile
# http://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile

ifeq ($(OS),Windows_NT)
	SHELL='c:/Program Files/Git/usr/bin/sh.exe'
endif

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: list
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '{if ($$1 !~ "^[#.]") {print $$1}}'

visdom:
	pipenv run python -m visdom.server

ipython:
	# PYTHONPATH=$(ROOT_DIR)/lib ipython --colors=NoColor
	ipython --colors=NoColor

yapf:
	yapf --recursive -i python

tmux:
	tmuxp load $(ROOT_DIR)/.tmux.yaml

# attach to existing tmux session
attach:
	tmux attach-session -t visdom-example

flake8:
	flake8

