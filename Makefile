#        _       _
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: Makefile
# Desc: Makerule

# Variables
GREEN := \x1b[1;32m
NOCOL := \x1b[0m
HOST  := $(shell hostname -s)
ARCH  := "$(shell uname -m)$(shell uname -s | tr '[:upper:]' '[:lower:]')"

# Phony & default targets
.PHONY: darwin-build darwin-load set-vars setup
default: setup darwin-build darwin-load

# Setup
setup:
	@echo "$(GREEN)>> INFO:$(NOCOL)  Running setup"
	mkdir -p $(HOME)/Pictures

# Set variables
set-vars:
	@echo "$(GREEN)>> INFO:$(NOCOL)  Setting variables"
	find . ! -path './.git/*' ! -name "Makefile" ! -name "unbuild.sh" -exec sed -iE 's/([^[:alpha:]])<HOST>([^[:alpha:]])/\1'"$(HOST)"'\2/g' {} \;
	find . ! -path './.git/*' ! -name "Makefile" ! -name "unbuild.sh" -exec sed -iE 's/([^[:alpha:]])<ARCH>([^[:alpha:]])/\1'"$(ARCH)"'\2/g' {} \;
	find . ! -path './.git/*' ! -name "Makefile" ! -name "unbuild.sh" -exec sed -iE 's/([^[:alpha:]])<HOME>([^[:alpha:]])/\1'"$(HOME)"'\2/g' {} \;
	find . ! -path './.git/*' ! -name "Makefile" ! -name "unbuild.sh" -exec sed -iE 's/([^[:alpha:]])<USER>([^[:alpha:]])/\1'"$(USER)"'\2/g' {} \;

# Build darwin
darwin-build:
	@echo "$(GREEN)>> INFO:$(NOCOL)  Building"
	nix build .#darwinConfigurations.$(HOST).system

# Darwin reload
darwin-load:
	@echo "$(GREEN)>> INFO:$(NOCOL)  Loading configuration"
	./result/sw/bin/darwin-rebuild switch --flake .
