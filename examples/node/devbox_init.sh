init_node() {
  echo "Node version: $(node --version)"
  echo "Npm version:  $(npm --version)"
  
  echo ""
  echo "Installing npm dependencies:"
  npm install
}

echo ""
echo "Executing $(basename $0) ..."

init_node

echo ""
echo "Done."
