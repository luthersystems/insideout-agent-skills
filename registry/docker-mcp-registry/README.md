# Docker MCP Registry submissions

Canonical copies of our submissions to [`docker/mcp-registry`](https://github.com/docker/mcp-registry). Each subdir mirrors the corresponding `servers/<name>/` directory in the upstream registry.

## Submission flow

1. Edit files locally in this directory.
2. Fork [`docker/mcp-registry`](https://github.com/docker/mcp-registry) into the `luthersystems` org (one-time):
   ```bash
   gh repo fork docker/mcp-registry --org luthersystems --clone=false
   ```
3. Clone the fork, copy the staged directory into `servers/<name>/`, validate, push, and PR:
   ```bash
   gh repo clone luthersystems/mcp-registry
   cd mcp-registry
   git checkout -b add-insideout-remote
   cp -r ../insideout-agent-skills/registry/docker-mcp-registry/insideout-remote servers/
   task validate -- --name insideout-remote
   task build -- --tools insideout-remote
   git add servers/insideout-remote
   git commit -m "Add insideout-remote MCP server"
   git push -u origin add-insideout-remote
   gh pr create --repo docker/mcp-registry \
     --title "Add insideout-remote MCP server" \
     --body-file servers/insideout-remote/readme.md
   ```
4. After upstream merges, the entry shows up at https://hub.docker.com/mcp ~24 h later.

## Current submissions

| Server | Type | Status | Upstream |
|---|---|---|---|
| `insideout-remote` | Remote (`streamable-http`) | Staged, not yet PR'd | — |
| `insideout` (local image) | Local (`luthersystems/insideout-mcp`) | Blocked on `mcp-server/` open-sourcing — see [reliable#1302](https://github.com/luthersystems/reliable/issues/1302) | — |

## Why we keep a local copy

The registry's `servers/<name>/` directory is the source of truth on Docker's side, but maintaining a local copy here lets us:
- Iterate on description, icon, tags before re-PR'ing.
- Track which fields changed across versions.
- Co-locate other registry/marketplace submissions (Glama, mcp.so, Cursor, Copilot) under one tree.
- Re-submit quickly without manual diffing.
