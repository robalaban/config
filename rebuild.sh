#!/bin/bash

set -e

echo "Building nix-darwin configuration..."
nix build .#darwinConfigurations.robert.system

echo "Switching to new configuration..."
./result/sw/bin/darwin-rebuild switch --flake .#robert

echo "Rebuild complete!"
