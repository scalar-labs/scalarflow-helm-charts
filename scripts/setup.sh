#!/bin/bash
#
# Setup script for development environment
#
# Run this after cloning: ./scripts/setup.sh
#

set -e

echo "Setting up development environment..."

# Configure git hooks path
echo "  → Configuring git hooks..."
git config core.hooksPath .git-hooks

# Install helm schema plugin if not installed
if ! helm plugin list | grep -q "schema"; then
    echo "  → Installing helm-values-schema-json plugin..."
    helm plugin install https://github.com/losisin/helm-values-schema-json.git
fi

echo "Done! Git hooks are now active."
