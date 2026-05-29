#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "================================================"
echo "  Figma Setup"
echo "================================================"
echo ""

# Check Claude Code is installed
if ! command -v claude &>/dev/null; then
  echo -e "${RED}Error: Claude Code is not installed or not in your PATH.${NC}"
  echo "Make sure you have completed Step 1 and Step 2 of the onboarding guide first."
  exit 1
fi

# Check Claude Code is authenticated
if ! claude --print "echo ok" &>/dev/null 2>&1; then
  echo -e "${RED}Error: Claude Code does not appear to be signed in.${NC}"
  echo "Run 'claude' in Terminal to sign in, then run this script again."
  exit 1
fi

echo "To connect Figma you need a Personal Access Token."
echo ""
echo "To generate one:"
echo "  1. Open Figma"
echo "  2. Click your profile picture (top-left)"
echo "  3. Go to Settings > Security"
echo "  4. Under Personal access tokens, click Generate new token"
echo "  5. Give it a name (e.g. Claude Code)"
echo "  6. Select all available scopes"
echo "  7. Set expiry to No expiration"
echo "  8. Click Generate token and copy it immediately"
echo ""

# Prompt for token
while true; do
  echo -n "Paste your Figma access token and press Enter: "
  read -r FIGMA_TOKEN
  if [ -n "$FIGMA_TOKEN" ]; then
    break
  fi
  echo -e "${YELLOW}Token cannot be empty. Please try again.${NC}"
done

echo ""
echo "Adding Figma to Claude Code..."
claude mcp add --transport http figma https://mcp.figma.com/mcp --scope user \
  --header "Authorization: Bearer $FIGMA_TOKEN"

echo ""
echo "================================================"
echo -e "${GREEN}  Figma connected!${NC}"
echo "================================================"
echo ""
echo "Open Claude Code, paste a Figma file URL and ask Claude to describe it."
echo "A successful response confirms everything is working."
echo ""
