#!/usr/bin/env bash
#
# Run Snyk agent-scan and fail only on findings not in the ignore list.
# W012 (external MCP dependency) is inherent to any MCP-based skill.
#
set -euo pipefail

IGNORED_CODES="W012"
RESULTS_FILE="/tmp/scan-results.json"

echo "Running Snyk agent-scan..."
set +e
uvx snyk-agent-scan@latest --skills ./SKILL.md --json > "$RESULTS_FILE" 2>/dev/null
set -e

python3 -c "
import json, sys

ignored = set('${IGNORED_CODES}'.split(','))
data = json.load(open('${RESULTS_FILE}'))
blocking = []

for key, client in data.items():
    for server in client.get('servers', []):
        for issue in server.get('issues', []):
            code = issue.get('code', '')
            msg = issue.get('message', '')[:120]
            if code in ignored:
                print(f'  [ignored] {code}: {msg}')
            else:
                blocking.append(f'{code}: {msg}')

if blocking:
    print()
    print('Blocking findings:')
    for b in blocking:
        print(f'  - {b}')
    sys.exit(1)
else:
    print()
    print('No blocking findings.')
"
