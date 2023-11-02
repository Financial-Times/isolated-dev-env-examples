#!/bin/bash
set -eo pipefail

install_dependencies() {
  echo ""
  echo "Installing npm dependencies:"
  npm install
}

print_version_info() {
  echo ""
  echo "node version: $(node --version)"
  echo "npm version:  v$(npm --version)"
}

echo ""
echo "\e[1;32m$(basename $0) ...\e[0m"

install_dependencies
print_version_info

echo ""
echo "\e[1;32mDone.\e[0m"

set +eo pipefail