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
ARCH  := "$(shell uname -m)$(shell uname -s | tr '[:upper:]' '[:lower:]')"
HOST := $(shell hostname -s)
RED_S := \x1b[31m
CYAN_S := \x1b[36m

# Phony & default targets
.PHONY: darwin-load set-vars setup clean acknowledge
default: setup darwin-build darwin-load clean acknowledge


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

clean:
	@echo "$(GREEN)>> INFO:$(NOCOL)  Cleaning"
	rm -rf ./result flake.lock

acknowledge:
	@echo "\n$(GREEN)>> INFO:$(NOCOL)  Post install"
	@echo "Add the following lines to your crontab:"
	@echo "$(CYAN_S)@reboot$(RED_S) skhd -c /etc/skhdrc >/dev/null 2>&1 &\n$(CYAN_S)@reboot $(RED_S)podman machine start >/dev/null 2>&1 &$(NOCOL)"
	@echo ">> Press any key to acknowledge"
	@read
