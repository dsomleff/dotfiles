#!/usr/bin/env bash

set_config() {
  local name="$1"
  local email="$2"

  jj config set --repo user.name "$name"
  jj config set --repo user.email "$email"

  echo "Configured JJ repo:"
  echo "  user.name  = $(jj config get user.name)"
    echo "  user.email = $(jj config get user.email)"
}

case "$PWD" in
  */Code/*)
    set_config "Dmytro Somliev" "dmytro.somliev@ibm.com"
    ;;
  */Pets/*|*/dotfiles/*)
    set_config "Dmytro Somliev" "somleff@gmail.com"
    ;;
  *)
    echo "No matching folder rule for $PWD"
    ;;
esac

