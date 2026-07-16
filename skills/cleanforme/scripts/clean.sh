#!/bin/bash

# macOS and Linux Cleanup Script for cleanforme-skill
# Run this script to scan and clear developer caches

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}=========================================${NC}"
echo -e "${CYAN}    macOS/Linux Cleanup - cleanforme      ${NC}"
echo -e "${CYAN}=========================================${NC}"
echo ""

# 1. System Temp Folder
echo -e "${YELLOW}Cleaning temporary files...${NC}"
rm -rf /tmp/* 2>/dev/null
rm -rf ~/Library/Caches/* 2>/dev/null
echo -e "${GREEN}✓ Temporary files cleaned.${NC}"

# 2. NPM Cache
if [ -d "$HOME/.npm" ]; then
  echo -e "${YELLOW}Cleaning NPM cache...${NC}"
  rm -rf "$HOME/.npm/*" 2>/dev/null
  npm cache clean --force 2>/dev/null
  echo -e "${GREEN}✓ NPM Cache cleaned.${NC}"
fi

# 3. Pip Cache
if [ -d "$HOME/.cache/pip" ]; then
  echo -e "${YELLOW}Cleaning Pip cache...${NC}"
  rm -rf "$HOME/.cache/pip/*" 2>/dev/null
  echo -e "${GREEN}✓ Pip Cache cleaned.${NC}"
elif [ -d "$HOME/Library/Caches/pip" ]; then
  echo -e "${YELLOW}Cleaning Pip cache...${NC}"
  rm -rf "$HOME/Library/Caches/pip/*" 2>/dev/null
  echo -e "${GREEN}✓ Pip Cache cleaned.${NC}"
fi

# 4. Gradle Cache
if [ -d "$HOME/.gradle" ]; then
  echo -e "${YELLOW}Cleaning Gradle cache...${NC}"
  rm -rf "$HOME/.gradle/caches" 2>/dev/null
  rm -rf "$HOME/.gradle/wrapper/dists" 2>/dev/null
  echo -e "${GREEN}✓ Gradle Cache cleaned.${NC}"
fi

# 5. Rust Cargo Cache
if [ -d "$HOME/.cargo" ]; then
  echo -e "${YELLOW}Cleaning Cargo registry caches...${NC}"
  rm -rf "$HOME/.cargo/registry/cache" 2>/dev/null
  rm -rf "$HOME/.cargo/registry/src" 2>/dev/null
  rm -rf "$HOME/.cargo/git/db" 2>/dev/null
  echo -e "${GREEN}✓ Cargo Cache cleaned.${NC}"
fi

# 6. Conda Cache
if command -v conda &> /dev/null; then
  echo -e "${YELLOW}Cleaning Conda Packages & Caches...${NC}"
  conda clean --all -y 2>/dev/null
  echo -e "${GREEN}✓ Conda Cache cleaned.${NC}"
fi

echo ""
echo -e "${CYAN}=========================================${NC}"
echo -e "${CYAN}           Cleanup Complete!             ${NC}"
echo -e "${CYAN}=========================================${NC}"
