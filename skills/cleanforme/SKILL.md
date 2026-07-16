---
name: cleanforme
description: Safely inspects, cleans, and optimizes disk space by clearing developer caches (Docker, conda, npm, pip, gradle, cargo), user temp files, and unused Android emulators across Windows, macOS, and Linux.
---

# cleanforme Skill

This skill allows the agent to inspect the local filesystem and reclaim wasted disk space from developer caches, virtual machines, and temp files across **Windows**, **macOS**, and **Linux**.

## Guidelines for Cleaning Disk Space

When the user requests to free up disk space, clean the machine, or when you notice that the disk space is low:

1. **Check Current Disk Space**:
   - On **Windows**: Run `Get-PSDrive -PSProvider FileSystem`
   - On **macOS / Linux**: Run `df -h /`

2. **Analyze Cache Sizes & Support Documents**:
   - Refer to the OS mapping document at `references/OS_MAPPING.md` to identify paths for the respective OS.
   - Scan for the sizes of folders specified in `references/OS_MAPPING.md` to see where the bulk of the space is being used.

3. **Check Docker Storage**:
   - Run `docker system df` to check Docker storage status.
   - If Docker is consuming a large amount of space, propose pruning.

4. **Execute Cleaning Steps (Ask/Confirm with User)**:
   - **Using Automated Scripts**:
     - On **Windows**: Run the PowerShell script at `scripts/clean.ps1`
     - On **macOS / Linux**: Execute the Bash script at `scripts/clean.sh`
   - **Docker Clean (All OS)**:
     - Stop containers: `docker stop $(docker ps -a -q)`
     - Remove containers: `docker rm $(docker ps -a -q)`
     - Prune system: `docker system prune -a --volumes -f`
     - Remove volumes: `docker volume rm $(docker volume ls -q)`
   - **Docker WSL Compaction (Windows only)**:
     - Check if `docker_data.vhdx` is large (under `AppData\Local\Docker\wsl\disk/`).
     - Copy the helper batch file `scripts/compact_docker.bat` into the user's home directory (e.g., `C:\Users\<user>\Compact_Docker_Disk.bat`).
     - Ask the user to run it by right-clicking and selecting **"Run as Administrator"**.
   - **Android Emulator**:
     - Inspect `~/.android/avd/` and delete unused AVD files and folders.

5. **Verify Reclaimed Space**:
   - Run disk space checks again (`Get-PSDrive` or `df -h`).
   - Present a clear summary of how much space was freed.
