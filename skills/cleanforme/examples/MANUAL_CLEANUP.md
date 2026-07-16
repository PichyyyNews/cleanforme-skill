# Manual System Cleanup Guide

If you prefer to run cleanups manually or if you want to inspect what commands are used, follow these step-by-step instructions for your specific operating system.

---

## 💻 Windows Manual Cleanup

### 1. Clear Temp Files
Open PowerShell as Administrator and run:
```powershell
Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
```

### 2. Clear NPM & Developer Caches
Run the following in PowerShell:
```powershell
# npm
npm cache clean --force
Remove-Item -Path "$env:APPDATA\npm-cache" -Recurse -Force -ErrorAction SilentlyContinue

# pip
pip cache purge

# gradle
Remove-Item -Path "$env:USERPROFILE\.gradle\caches" -Recurse -Force -ErrorAction SilentlyContinue

# conda
conda clean --all -y
```

### 3. Compact Docker WSL Disk
1. Run `wsl --shutdown`
2. Open cmd as Administrator and run `diskpart`
3. Enter these sub-commands:
   ```text
   select vdisk file="C:\Users\<your-username>\AppData\Local\Docker\wsl\disk\docker_data.vhdx"
   attach vdisk readonly
   compact vdisk
   detach vdisk
   exit
   ```

---

## 🍏 macOS & 🐧 Linux Manual Cleanup

### 1. Clear Temp Files
Open terminal and run:
```bash
rm -rf /tmp/* 2>/dev/null
rm -rf ~/Library/Caches/* 2>/dev/null # macOS only
```

### 2. Clear Developer Caches
Run the following commands:
```bash
# npm
npm cache clean --force
rm -rf ~/.npm

# pip
pip cache purge
rm -rf ~/.cache/pip

# gradle
rm -rf ~/.gradle/caches
rm -rf ~/.gradle/wrapper/dists

# cargo (Rust)
rm -rf ~/.cargo/registry/cache
rm -rf ~/.cargo/registry/src
rm -rf ~/.cargo/git/db

# conda
conda clean --all -y
```

### 3. Docker Cleanup (All OS)
Run the following commands in sequence:
```bash
# Stop and remove containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# System prune
docker system prune -a --volumes -f

# Remove remaining volumes
docker volume rm $(docker volume ls -q)
```
