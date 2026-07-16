---
name: cleanforme
description: Safely inspects, cleans, and optimizes disk space by clearing developer caches (Docker, conda, npm, pip, gradle, cargo), user temp files, and unused Android emulators.
---

# cleanforme Skill

This skill allows the agent to inspect the local filesystem and reclaim wasted disk space from developer caches, virtual machines, and temp files.

## Guidelines for Cleaning Disk Space

When the user requests to free up disk space, clean the machine, or when you notice that the disk space is low:

1. **Check Current Disk Space**:
   - Run `Get-PSDrive -PSProvider FileSystem` on Windows, or `df -h` on Unix-like systems.
   - Note the free and used space on the main system drive.

2. **Scan for Large Cache Directories**:
   Check the sizes of the following common developer cache and temporary directories:
   - Windows Temp: `C:\Users\<username>\AppData\Local\Temp`
   - NPM Cache: `C:\Users\<username>\AppData\Local\npm-cache` (or `~/.npm`)
   - Pip Cache: `C:\Users\<username>\AppData\Local\pip\cache` (or `~/.cache/pip`)
   - Gradle Cache: `C:\Users\<username>\.gradle`
   - Cargo/Rust Cache: `C:\Users\<username>\.cargo` and `C:\Users\<username>\.rustup` (or `~/.cargo`)
   - Android AVDs: `C:\Users\<username>\.android\avd` (or `~/.android/avd`)
   - Conda Cache: `C:\Users\<username>\miniconda3` (or any conda path)

3. **Check Docker Usage**:
   - Run `docker system df` to check Docker storage status.
   - If Docker is consuming a large amount of space, propose pruning.

4. **Execute Cleaning Steps (Ask/Confirm with User)**:
   - **Docker Clean**:
     - Run `docker stop $(docker ps -a -q)` to stop all containers.
     - Run `docker rm $(docker ps -a -q)` to remove containers.
     - Run `docker system prune -a --volumes -f` to clean unused images, caches, and volumes.
     - Run `docker volume rm $(docker volume ls -q)` to remove remaining volumes.
   - **WSL/Docker VHDX Compaction (Windows only)**:
     - On Windows, WSL2 virtual disks do not shrink automatically. Find `docker_data.vhdx` (typically under `AppData\Local\Docker\wsl\disk/`).
     - Write a diskpart script:
       ```text
       select vdisk file="<path-to-docker_data.vhdx>"
       attach vdisk readonly
       compact vdisk
       detach vdisk
       ```
     - Instruct the user to run this script as Administrator, or write a `.bat` file (e.g. `Compact_Docker_Disk.bat`) in their user directory and guide them to right-click and "Run as Administrator".
   - **Windows Temp**:
     - Delete temporary files: `Remove-Item -Path "C:\Users\<username>\AppData\Local\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue`
   - **Developer Caches**:
     - NPM: Clean npm cache or delete `npm-cache` folder.
     - Pip: Clean pip cache folder.
     - Gradle: Delete `.gradle` folder (warn the user that subsequent builds might be slower due to re-downloading dependencies).
     - Rust/Cargo: Delete `.cargo` and `.rustup` folders (warn the user about rebuild times).
     - Conda: Run `conda clean --all -y` to clean packages and tarballs.
   - **Android Emulator**:
     - Check `.android/avd/` and delete unused emulator folders and `.ini` files.

5. **Verify Free Space**:
   - Run `Get-PSDrive -PSProvider FileSystem` (or `df -h`) again.
   - Calculate total space reclaimed and present a summary to the user.
