echo ""
python --version
pip --version

echo ""
echo "Activating python virtual env:"
echo $VENV_DIR
source $VENV_DIR/bin/activate

echo ""
echo "Installing python requirements:"
pip install -r requirements.txt

echo ""
echo "Setting up Doppler secrets:"
doppler run -- true  2> /dev/null
if [ $? -ne 0 ]; then
  doppler login
fi
if [ -z $(doppler configure get config --plain) ]; then
  doppler setup -p isolated-dev-env-examples
fi
source <(doppler secrets download --no-file --format env)
echo "Done."
