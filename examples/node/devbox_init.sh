init_node() {
  echo "Node version: $(node --version)"
  echo "Npm version:  $(npm --version)"
  
  echo ""
  echo "Installing npm dependencies:"
  npm install
}

init_doppler () {
  echo ""
  echo "Doppler version: $(doppler --version)"
  doppler run -- true  2> /dev/null
  if [ $? -ne 0 ]; then
    echo "Authenticate with Doppler:"
    doppler login
  fi
  if [ -z $(doppler configure get config --plain) ]; then
    echo "Configure Doppler config:"
    doppler setup -p $DOPPLER_PROJECT
  fi
  echo "Configuring Doppler secrets as env vars:"
  echo "  project: $(doppler configure get project --plain)"
  echo "  config:  $(doppler configure get config --plain)"
  source <(doppler secrets download --no-file --format env)
}

echo ""
echo "Executing $(basename $0) ..."

init_node

DOPPLER_PROJECT="repo_isolated-dev-env-examples"
init_doppler

echo ""
echo "Done."
