#!/usr/bin/env bash
set -e

# Versions
FLUTTER_CHANNEL=stable

# Install dependencies
sudo apt-get update
sudo apt-get install -y curl git unzip xz-utils libglu1-mesa clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev

# Install Flutter
if [ ! -d "$HOME/flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b $FLUTTER_CHANNEL $HOME/flutter
fi
echo 'export PATH="$HOME/flutter/bin:$PATH"' >> $HOME/.bashrc
echo 'export PATH="$HOME/flutter/bin:$PATH"' >> $HOME/.zshrc
export PATH="$HOME/flutter/bin:$PATH"

# Pre-download artifacts for web
flutter config --enable-web
flutter precache --web

# Doctor
flutter doctor -v
