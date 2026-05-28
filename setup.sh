#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo ""
echo "================================================"
echo "  Claude Code Setup"
echo "================================================"
echo ""

# Check macOS version
echo "Checking macOS version..."
OS_VERSION=$(sw_vers -productVersion)
MAJOR=$(echo "$OS_VERSION" | cut -d. -f1)
if [ "$MAJOR" -lt 13 ]; then
  echo -e "${RED}Error: macOS 13 or higher is required. You have $OS_VERSION.${NC}"
  exit 1
fi
echo -e "${GREEN}macOS $OS_VERSION — OK${NC}"

# Check for Homebrew
echo ""
echo "Checking for Homebrew..."
if ! command -v brew &>/dev/null; then
  echo -e "${YELLOW}Homebrew not found. Installing...${NC}"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [ -f "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  echo -e "${GREEN}Homebrew installed.${NC}"
else
  echo -e "${GREEN}Homebrew found — OK${NC}"
fi

# Check for Node.js v18+
echo ""
echo "Checking for Node.js..."
if ! command -v node &>/dev/null; then
  echo -e "${YELLOW}Node.js not found. Installing...${NC}"
  brew install node
  echo -e "${GREEN}Node.js installed.${NC}"
else
  NODE_MAJOR=$(node --version | cut -d. -f1 | tr -d 'v')
  if [ "$NODE_MAJOR" -lt 18 ]; then
    echo -e "${YELLOW}Node.js v$NODE_MAJOR found but v18+ required. Upgrading...${NC}"
    brew upgrade node || brew install node
    echo -e "${GREEN}Node.js upgraded.${NC}"
  else
    echo -e "${GREEN}Node.js $(node --version) — OK${NC}"
  fi
fi

# Check for Claude Code CLI
echo ""
echo "Checking for Claude Code..."
if command -v claude &>/dev/null; then
  CLAUDE_VERSION=$(claude --version 2>&1 | head -1)
  echo -e "${GREEN}Claude Code already installed — OK${NC}"
else
  echo -e "${YELLOW}Claude Code not found. Installing...${NC}"
  npm install -g @anthropic-ai/claude-code
  if ! command -v claude &>/dev/null; then
    echo -e "${RED}Error: Claude Code could not be verified. Try running 'npm install -g @anthropic-ai/claude-code' manually.${NC}"
    exit 1
  fi
  echo -e "${GREEN}Claude Code installed.${NC}"
fi

echo ""
echo "================================================"
echo -e "${GREEN}  Setup complete!${NC}"
echo "================================================"
echo ""
echo "Follow the next steps at:"
echo "https://github.com/matt99is/claude-code-setup#next-steps"
echo ""
