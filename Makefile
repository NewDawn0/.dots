#        _       _       
#     __| | ___ | |_ ___ 
#    / _` |/ _ \| __/ __|
#   | (_| | (_) | |_\__ \
#  (_)__,_|\___/ \__|___/
# github.com:NewDawn0/.dots
#
# File: Makefile
# Desc: Makefile decl

# Colours
GREEN=\x1b[1;32m
RESET=\x1b[0m

# Phony targets
.PHONY: darwin

# Darwin build
darwin: darwin-setup darwin-build

darwin-setup:
	@printf '%bInfo%b  Setting variables\n' "$(GREEN)" "$(RESET)" 
	HOST=$(hostname -s)
	ARCH="$(uname -m)-$(uname -s | tr '[:upper:]' '[:lower:]')"
	find . -type f ! -name "bootstrap.sh" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)OME\([^[:alpha:]-]\)#\1'"$HOME"'\2#g' {} \;
	find . -type f ! -name "bootstrap.sh" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)OST\([^[:alpha:]-]\)#\1'"$HOST"'\2#g' {} \;
	find . -type f ! -name "bootstrap.sh" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)SET\([^[:alpha:]-]\)#\1'"$USER"'\2#g' {} \;
	find . -type f ! -name "bootstrap.sh" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)RCH\([^[:alpha:]-]\)#\1'"$ARCH"'\2#g' {} \;

darwin-build:
	@printf '%bInfo%b  Building\n' "$(GREEN)" "$(RESET)" 
	nix build .#darwin.system
