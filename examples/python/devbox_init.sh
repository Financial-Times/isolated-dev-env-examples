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

echo ""
echo "Executing $(basename $0) ..."

init_python

echo ""
echo "Done."
