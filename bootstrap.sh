#!/bin/bash
HOST=$(hostname -s)
ARCH="$(uname -m)-$(uname -s | tr '[:upper:]' '[:lower:]')"
find . -type f ! -name "bootstrap.sh" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)<HOME>\([^[:alpha:]-]\)#\1'"$HOME"'\2#g' {} \;
find . -type f ! -name "bootstrap.sh" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)<HOST>\([^[:alpha:]-]\)#\1'"$HOST"'\2#g' {} \;
find . -type f ! -name "bootstrap.sh" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)<USER>\([^[:alpha:]-]\)#\1'"$USER"'\2#g' {} \;
find . -type f ! -name "bootstrap.sh" ! -name "unbuild.sh" -exec sed -i 's#\([^[:alpha:]-]\)<ARCH>\([^[:alpha:]-]\)#\1'"$ARCH"'\2#g' {} \;
