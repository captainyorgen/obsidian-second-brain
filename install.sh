#!/bin/bash

set -e

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
COMMANDS_DIR="$CLAUDE_DIR/commands"
SKILLS_DIR="$CLAUDE_DIR/skills"

echo "Installing obsidian-second-brain..."

# Create directories if needed
mkdir -p "$COMMANDS_DIR"
mkdir -p "$SKILLS_DIR"

# Link or copy commands to ~/.claude/commands/
echo "Installing slash commands..."
for file in "$SKILL_DIR/commands/"*.md; do
  name=$(basename "$file")
  dest="$COMMANDS_DIR/$name"
  if [ -f "$dest" ]; then
    echo "  skipping $name (already exists)"
  else
    cp "$file" "$dest"
    echo "  installed $name"
  fi
done

# Link skill into ~/.claude/skills/
SKILL_LINK="$SKILLS_DIR/obsidian-second-brain"
if [ -e "$SKILL_LINK" ]; then
  echo "Skill already linked at $SKILL_LINK"
else
  ln -s "$SKILL_DIR" "$SKILL_LINK"
  echo "Skill linked at $SKILL_LINK"
fi

echo ""
echo "Done. Restart Claude Code to activate the commands."
echo ""
echo "Next step: run /obsidian-init to generate your vault's _CLAUDE.md"
