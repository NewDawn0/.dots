#        _       _       
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: Makefile
# Desc: Makefile for dots

# Colours
GREEN=\x1b[1;32m
RESET=\x1b[0m

# Phony targets
.PHONY: darwin
HOST := $(shell hostname -s)
ARCH :="$(shell uname -m)-$(shell uname -s | tr '[:upper:]' '[:lower:]')"
# Darwin build
darwin: darwin-setup darwin-build

darwin-setup:
	@printf '%bInfo%b  Setting variables\n' "$(GREEN)" "$(RESET)" 
	find . -type f ! -name "Makefile" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)<HOME>\([^[:alpha:]-]\)#\1'"$(HOME)"'\2#g' {} \;
	find . -type f ! -name "Makefile" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)<HOST>\([^[:alpha:]-]\)#\1'"$(HOST)"'\2#g' {} \;
	find . -type f ! -name "Makefile" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)<USER>\([^[:alpha:]-]\)#\1'"$(USER)"'\2#g' {} \;
	find . -type f ! -name "Makefile" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)<ARCH>\([^[:alpha:]-]\)#\1'"$(ARCH)"'\2#g' {} \;

darwin-build:
	@printf '%bInfo%b  Building\n' "$(GREEN)" "$(RESET)" 
	nix build .#darwinConfigurations.$(HOST).system
