# Thin re-export of the canonical InsideOut MCP server image.
#
# The real binary is built from the private luthersystems/reliable
# repo (mcp-server/cmd/insideout-mcp/) and published to Docker Hub by
# .github/workflows/mcp-server-release.yaml on every merge to main and
# every v* tag. This file lets directories that build from a Dockerfile
# (Glama, Docker MCP Registry) ingest the same artifact without duplicating
# the build pipeline.
#
# The image runs in stdio mode by default; override the backend with
#   docker run -e INSIDEOUT_BASE_URL=https://insideout.luthersystemsapp.com ...
FROM luthersystems/insideout-mcp:v0.50.1
