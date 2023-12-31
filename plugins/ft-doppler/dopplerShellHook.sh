#!/bin/bash
set -eo pipefail

init_doppler () {
  echo ""
  echo "Doppler CLI version: $(doppler --version)"

  # Check if user is authenticated with Doppler
  doppler whoami --no-read-env >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo "Authenticate with Doppler:"
    doppler login
  fi

  # Check if config is set up, allow use of DOPPLER_PROJECT env var as safe to checkin
  if [ -z $(doppler configure get project --plain) ]; then
    echo "Configure Doppler config:"
    doppler setup --no-read-env
  fi

  # Check if config is set up, don't allow use of DOPPLER_CONFIG env var as not safe to checkin
  if [ -z $(doppler configure get config --plain --no-read-env) ]; then
    echo "Configure Doppler config:"
    doppler setup --no-read-env
  fi

}

load_secrets () {
  # Useful diagnostic output
  echo "Configuring Doppler secrets as env vars:"
  echo "  project: $(doppler configure get project --plain --no-read-env)"
  echo "  config:  $(doppler configure get config --plain --no-read-env)"

  SECRETS=$(doppler secrets download --no-file --no-read-env --format env)

  while IFS= read -r secret; do
    eval "export $secret"
  done < <(printf '%s' "$SECRETS" | grep -v '^DOPPLER_PROJECT=\|^DOPPLER_CONFIG=\|^DOPPLER_ENVIRONMENT=')
}

echo ""
echo "\e[1;32mft-devbox-plugins/load_doppler_secrets/$(basename $0) ...\e[0m"

init_doppler
load_secrets

echo ""
echo "\e[1;32mDone.\e[0m"

set +eo pipefail

