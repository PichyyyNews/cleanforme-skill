# cleanforme-skill

An AI agent skill to help clean up disk space, system temp files, developer caches (Docker, Conda, NPM, pip, Gradle, Cargo/Rust), and unused Android emulators.

## Installation

You can install this skill for your AI agents (such as Claude Code, Cursor, Windsurf, Cline, Gemini, and Antigravity) using the `skills` CLI:

```bash
npx skills add PichyyyNews/cleanforme-skill
```

## How It Works

Once installed, your AI agent will gain the procedural knowledge to safely and systematically free up disk space on your machine.

When you ask the agent to free up disk space, clean your machine, or when the agent detects low storage, it will:
1. **Analyze:** Inspect your disk space and check size of common temporary folders.
2. **Docker Clean:** Stop/remove all containers, prune unused images, volumes, and build cache.
3. **VHDX Compaction (WSL2):** Create a script for you to compact the virtual disk `docker_data.vhdx` (reclaiming 20+ GB of host space).
4. **Developer Caches:** Clean npm cache, pip cache, gradle packages, and cargo/rustup files.
5. **Conda Cleanup:** Run `conda clean` to remove unused packages and tarballs.
6. **Android Emulator:** Clean up unused AVD (Android Virtual Device) images.
7. **System Temp:** Clear user temp directories.

## Supported Agents

This skill is compatible with any AI coding assistant that supports the open agent skills ecosystem, including:
- Claude Code
- Cursor
- Windsurf
- Cline
- Gemini
- Antigravity

---
*Created with love by PichyyyNews.*
