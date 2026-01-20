#!/bin/bash
#
# Generate values.schema.json for all Helm charts
#
# Setup:
#   1. Install plugin: helm plugin install https://github.com/losisin/helm-values-schema-json.git --version v2.3.1
#   2. Enable hooks: git config core.hooksPath .git-hooks
#

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CHARTS_DIR="$REPO_ROOT/scalarflow/charts"

# Check plugin
if ! helm plugin list | grep -q "schema"; then
    echo "ERROR: helm-values-schema-json plugin not installed."
    echo ""
    echo "Install with:"
    echo "  helm plugin install https://github.com/losisin/helm-values-schema-json.git --version v2.3.1"
    exit 1
fi

echo "Generating schemas..."

for chart_dir in "$CHARTS_DIR"/*/; do
    if [[ -f "$chart_dir/Chart.yaml" && -f "$chart_dir/values.yaml" ]]; then
        chart_name=$(basename "$chart_dir")
        echo "  → $chart_name"
        (cd "$chart_dir" && helm schema -f values.yaml -o values.schema.json --draft 2020 --indent 2)
    fi
done

echo "Done."
