# OS Mapping & Directory Reference

This document maps all the directories, caches, and cleanup commands across **Windows**, **macOS**, and **Linux** to ensure the `cleanforme` skill functions correctly on all platforms.

---

## 📂 Cache Paths by Operating System

| Target | Windows Path | macOS Path | Linux Path |
| :--- | :--- | :--- | :--- |
| **System Temp** | `C:\Users\<user>\AppData\Local\Temp` | `/tmp` or `~/Library/Caches` | `/tmp` or `~/.cache` |
| **NPM Cache** | `C:\Users\<user>\AppData\Local\npm-cache` | `~/.npm` | `~/.npm` |
| **Pip Cache** | `C:\Users\<user>\AppData\Local\pip\cache` | `~/Library/Caches/pip` | `~/.cache/pip` |
| **Gradle Cache** | `C:\Users\<user>\.gradle` | `~/.gradle` | `~/.gradle` |
| **Cargo Cache** | `C:\Users\<user>\.cargo` | `~/.cargo` | `~/.cargo` |
| **Rustup Cache** | `C:\Users\<user>\.rustup` | `~/.rustup` | `~/.rustup` |
| **Android AVD** | `C:\Users\<user>\.android\avd` | `~/.android/avd` | `~/.android/avd` |
| **Conda Cache** | `C:\Users\<user>\miniconda3` or `Anaconda3` | `~/miniconda3` or `~/anaconda3` | `~/miniconda3` or `~/anaconda3` |

---

## 🧹 Command Reference by OS

### 1. Check Disk Space
*   **Windows (PowerShell):** `Get-PSDrive -PSProvider FileSystem`
*   **macOS / Linux (Bash):** `df -h /`

### 2. Docker Pruning
*   **All Platforms:**
    *   Stop active containers: `docker stop $(docker ps -a -q)`
    *   Remove containers: `docker rm $(docker ps -a -q)`
    *   System prune (images, networks, build cache): `docker system prune -a --volumes -f`
    *   Remove local volumes: `docker volume rm $(docker volume ls -q)`

### 3. Docker VHDX Compaction (WSL2 / Windows Host only)
*   **Windows Command Prompt (Admin):**
    ```cmd
    wsl --shutdown
    diskpart /s compact_script.txt
    ```
    *Where `compact_script.txt` contains:*
    ```text
    select vdisk file="C:\Users\<user>\AppData\Local\Docker\wsl\disk\docker_data.vhdx"
    attach vdisk readonly
    compact vdisk
    detach vdisk
    ```

### 4. Conda Clean
*   **All Platforms:** `conda clean --all -y`

### 5. Package Managers
*   **NPM Cache Clean:** `npm cache clean --force` or delete the npm-cache directory.
*   **Pip Cache Clean:** `pip cache purge` or delete the pip cache directory.
*   **Gradle Clean:** Delete the `caches` and `wrapper/dists` folders inside the `.gradle` directory.
*   **Cargo Clean:** Delete the `registry` and `git` folders inside the `.cargo` directory.
