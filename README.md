# 🧹 cleanforme-skill

<p align="center">
  <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Objects/Broom.png" alt="Broom" width="120" height="120" />
</p>

<p align="center">
  <strong>An elegant, automated AI agent skill to scan, clean, and reclaim system storage and developer caches.</strong>
</p>

<p align="center">
  <a href="https://skills.sh/pichyyynews/cleanforme-skill"><img src="https://img.shields.io/badge/skills.sh-PichyyyNews%2Fcleanforme--skill-blue?style=for-the-badge&logo=vercel" alt="skills.sh" /></a>
  <img src="https://img.shields.io/github/stars/PichyyyNews/cleanforme-skill?style=for-the-badge&color=gold" alt="Stars" />
  <img src="https://img.shields.io/github/license/PichyyyNews/cleanforme-skill?style=for-the-badge&color=green" alt="License" />
</p>

---

## 🚀 Overview

**cleanforme-skill** is a premium agent capabilities bundle designed for the modern AI developer. It equips your AI agents (Claude Code, Cursor, Cline, Windsurf, Gemini, etc.) with the direct capability to analyze disk space, discover wasteful build caches, and safely delete garbage data—saving you tens of gigabytes of storage automatically.

---

## ⚡ Installation

Install it directly into your local agent environment using the `skills` CLI:

```bash
npx skills add PichyyyNews/cleanforme-skill
```

---

## 💎 Features & Capabilities

Your AI assistant will gain the ability to perform the following operations:

| Resource / Cache | Cleanup Action | Estimated Reclaimed Space |
| :--- | :--- | :--- |
| **🐳 Docker Engine** | Stop/delete all containers, prune unused images, volumes, and builder cache. | **20 GB - 50 GB+** |
| **💾 WSL2 Virtual Disk (`.vhdx`)** | Automatically generate and instruct disk compaction via `diskpart` (reclaims host space). | **15 GB - 30 GB+** |
| **🤖 Android Emulator (AVD)** | Scan and delete unused device system/snapshot images in `.android/avd/`. | **5 GB - 15 GB+** |
| **📦 Conda Package Manager** | Run `conda clean` to remove cached index files, tarballs, and unused packages. | **5 GB - 10 GB+** |
| **☕ Gradle Cache** | Clear cached build artifacts and package dependencies (`~/.gradle`). | **2 GB - 5 GB** |
| **🟢 Node Package Manager** | Wipe global NPM and package cache files (`~/.npm` / `npm-cache`). | **1 GB - 3 GB** |
| **🦀 Rust Cargo / Rustup** | Remove built artifact caches and index registries (`~/.cargo` & `~/.rustup`). | **1 GB - 3 GB** |
| **🐍 Python Pip** | Clean download packages cache (`~/.cache/pip`). | **0.5 GB - 2 GB** |
| **⚙️ System Temp Files** | Safe deletion of temporary OS/app logs and transient files (`AppData/Local/Temp`). | **1 GB - 5 GB** |

---

## 🛠️ Usage Example

Simply ask your AI agent to clean your system, for example:
> *"Help inspect my disk and free up some space, my C drive is getting full."*

The agent will automatically trigger this skill, scan the predefined folders, present a checklist of items to clean, and execute the cleanup safely with your consent.

---

## 📂 Repository Layout

```tree
cleanforme-skill/
├── README.md               # Beautiful documentation page
├── skills.sh.json          # Repository groupings config
└── skills/
    └── cleanforme/
        └── SKILL.md        # AI Agent executable prompt & instructions
```

---

<p align="center">
  Built with ❤️ for the AI agent developer community. Feel free to star ⭐ this repository if it helped you free up space!
</p>
