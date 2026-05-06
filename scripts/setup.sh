#!/usr/bin/env bash
# setup.sh — obsidian-second-brain one-command installer
#
# Usage:
#   bash ~/.claude/skills/obsidian-second-brain/scripts/setup.sh "/path/to/your/vault"
#
# What it does:
#   1. Validates the vault path
#   2. Adds OBSIDIAN_VAULT_PATH to ~/.claude/settings.json
#   3. Registers slash commands in ~/.claude/commands/
#   4. Configures the MCP server for Claude Code (optional)

set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SETTINGS="$HOME/.claude/settings.json"

# ── helpers ──────────────────────────────────────────────────────────────────

green()  { printf '\033[0;32m%s\033[0m\n' "$1"; }
yellow() { printf '\033[0;33m%s\033[0m\n' "$1"; }
red()    { printf '\033[0;31m%s\033[0m\n' "$1"; }
step()   { printf '\n\033[1m%s\033[0m\n' "$1"; }

# ── vault path ───────────────────────────────────────────────────────────────

VAULT="${1:-}"
if [[ -z "$VAULT" ]]; then
  red "Error: vault path required."
  echo "Usage: bash scripts/setup.sh \"/path/to/your/vault\""
  exit 1
fi

VAULT="$(eval echo "$VAULT")"  # expand ~

if [[ ! -d "$VAULT" ]]; then
  red "Error: vault directory not found: $VAULT"
  echo "Create it first or check the path."
  exit 1
fi

echo ""
echo "obsidian-second-brain setup"
echo "==========================="
echo "Vault: $VAULT"
echo "Skill: $SKILL_DIR"
echo ""

# ── ensure settings.json exists ───────────────────────────────────────────────

step "1. Updating ~/.claude/settings.json..."

if [[ ! -f "$SETTINGS" ]]; then
  echo "{}" > "$SETTINGS"
  echo "   Created $SETTINGS"
fi

# Validate JSON
if ! jq empty "$SETTINGS" 2>/dev/null; then
  red "Error: $SETTINGS contains invalid JSON. Fix it first."
  exit 1
fi

# ── add env var ───────────────────────────────────────────────────────────────

jq --arg vault "$VAULT" '
  .env = (.env // {}) | .env.OBSIDIAN_VAULT_PATH = $vault
' "$SETTINGS" > "$SETTINGS.tmp" && cat "$SETTINGS.tmp" > "$SETTINGS" && rm "$SETTINGS.tmp"

green "   OBSIDIAN_VAULT_PATH set"

# ── register slash commands ──────────────────────────────────────────────────

step "2. Registering slash commands in ~/.claude/commands/..."

COMMANDS_SRC="$SKILL_DIR/commands"
COMMANDS_DST="$HOME/.claude/commands"

if [[ ! -d "$COMMANDS_SRC" ]]; then
  yellow "   No commands/ directory in skill — skipping"
else
  mkdir -p "$COMMANDS_DST"
  linked=0
  skipped=0
  blocked=0
  for cmd in "$COMMANDS_SRC"/*.md; do
    [[ -e "$cmd" ]] || continue
    name=$(basename "$cmd")
    target="$COMMANDS_DST/$name"
    if [[ -L "$target" ]]; then
      # already a symlink — refresh it (idempotent, handles repo path changes)
      ln -snf "$cmd" "$target"
      skipped=$((skipped + 1))
    elif [[ -e "$target" ]]; then
      yellow "   Skipped $name — file already exists (not a symlink). Remove it manually if you want the skill version."
      blocked=$((blocked + 1))
    else
      ln -s "$cmd" "$target"
      linked=$((linked + 1))
    fi
  done
  green "   $linked new, $skipped refreshed, $blocked blocked"
fi

# ── optional: MCP server (Claude Code only) ───────────────────────────────────

step "3. MCP server (optional — Claude Code only)..."
echo "   The obsidian-vault MCP server gives Claude faster vault access."
echo "   Without it, Claude reads/writes vault files directly (works fine)."
echo ""
read -r -p "   Configure MCP server for Claude Code? [y/N] " REPLY
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  if command -v claude &>/dev/null; then
    claude mcp add obsidian-vault -s user -- npx -y mcp-obsidian "$VAULT"
    green "   MCP server configured"
  else
    yellow "   claude CLI not found — skipping MCP setup"
    echo "   Run manually when ready:"
    echo "   claude mcp add obsidian-vault -s user -- npx -y mcp-obsidian \"$VAULT\""
  fi
else
  echo "   Skipped. Run later if you want it:"
  echo "   claude mcp add obsidian-vault -s user -- npx -y mcp-obsidian \"$VAULT\""
fi

# ── done ─────────────────────────────────────────────────────────────────────

echo ""
echo "==========================="
green "Setup complete."
echo ""
echo "Next step: drop a _CLAUDE.md into your vault so Claude knows how it's structured."
echo "Open Claude Code in your vault directory and run:"
echo ""
echo "   /obsidian-init"
echo ""
echo "That's it. Claude will scan your vault and generate its operating manual."
echo ""
echo "Health check: python scripts/vault_health.py --path \"$VAULT\""
echo ""
