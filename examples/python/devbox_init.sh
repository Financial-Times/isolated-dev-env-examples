init_python () {
  echo ""
  echo "Python version: $(python --version)"
  echo "Pip version:    $(pip --version)"

  echo ""
  echo "Activating python virtual env:"
  echo $VENV_DIR
  source $VENV_DIR/bin/activate

  echo ""
  echo "Installing python requirements:"
  python -m pip install -r requirements.txt
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
    doppler setup -p isolated-dev-env-examples
  fi
  echo "Configuring Doppler secrets as env vars:"
  echo "  project: $(doppler configure get project --plain)"
  echo "  config:  $(doppler configure get config --plain)"
  source <(doppler secrets download --no-file --format env)
}

echo ""
echo "Executing $(basename $0) ..."

init_python
init_doppler

echo ""
echo "Done."
