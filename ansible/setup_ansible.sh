#!/bin/bash
set -euo pipefail

if command -v ansible >/dev/null 2>&1; then
    echo "==> ansible is already installed, skipping installation"
else
    [[ $EUID -eq 0 ]] || { echo "ERROR: must be run as root to install ansible-core" >&2; exit 1; }
    echo "==> Installing ansible-core from the local dnf repository"
    dnf -y install ansible-core
fi

ansible --version