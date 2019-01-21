#!/bin/sh

set -e

GIT_AUTHOR_NAME=${GIT_AUTHOR_NAME-"Automated Github Action"}
GIT_AUTHOR_EMAIL=${GIT_AUTHOR_EMAIL-"actions@github.io"}

git config user.name "$GIT_AUTHOR_NAME"
git config user.email "$GIT_AUTHOR_EMAIL"

if [ -n "$NPM_AUTH_TOKEN" ]; then
  # Respect NPM_CONFIG_USERCONFIG if it is provided, default to $HOME/.npmrc
  NPM_CONFIG_USERCONFIG="${NPM_CONFIG_USERCONFIG-"$HOME/.npmrc"}"
  NPM_REGISTRY_URL="${NPM_REGISTRY_URL-registry.npmjs.org}"

  # Allow registry.npmjs.org to be overridden with an environment variable
  printf "//%s/:_authToken=%s\\nregistry=%s" "$NPM_REGISTRY_URL" "$NPM_AUTH_TOKEN" "$NPM_REGISTRY_URL" > "$NPM_CONFIG_USERCONFIG"
  chmod 0600 "$NPM_CONFIG_USERCONFIG"
fi

sh -c "npm $*"
