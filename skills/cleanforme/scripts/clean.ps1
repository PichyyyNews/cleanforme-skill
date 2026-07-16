# Windows Cleanup Script for cleanforme-skill
# Run this script to automatically scan and clean developer caches

$UserDir = [System.Environment]::GetFolderPath("UserProfile")

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "   Windows System Cleanup - cleanforme   " -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# 1. System Temp Folder
$TempPath = "$env:TEMP"
if (Test-Path $TempPath) {
    Write-Host "Cleaning Windows Temp Folder..." -ForegroundColor Yellow
    Remove-Item -Path "$TempPath\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "✓ Windows Temp cleaned." -ForegroundColor Green
}

# 2. NPM Cache
$NpmCachePath = "$env:APPDATA\npm-cache"
$NpmLocalCachePath = "$env:LOCALAPPDATA\npm-cache"
foreach ($path in @($NpmCachePath, $NpmLocalCachePath)) {
    if (Test-Path $path) {
        Write-Host "Cleaning NPM Cache..." -ForegroundColor Yellow
        Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "✓ NPM Cache cleaned." -ForegroundColor Green
    }
}

# 3. Pip Cache
$PipCachePath = "$env:LOCALAPPDATA\pip\cache"
if (Test-Path $PipCachePath) {
    Write-Host "Cleaning Pip Cache..." -ForegroundColor Yellow
    Remove-Item -Path $PipCachePath -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "✓ Pip Cache cleaned." -ForegroundColor Green
}

# 4. Gradle Cache
$GradlePath = "$UserDir\.gradle"
if (Test-Path $GradlePath) {
    Write-Host "Cleaning Gradle Cache..." -ForegroundColor Yellow
    Remove-Item -Path "$GradlePath\caches" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$GradlePath\wrapper\dists" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "✓ Gradle Cache cleaned." -ForegroundColor Green
}

# 5. Rust Cargo Cache
$CargoPath = "$UserDir\.cargo"
if (Test-Path $CargoPath) {
    Write-Host "Cleaning Cargo Registry Cache..." -ForegroundColor Yellow
    Remove-Item -Path "$CargoPath\registry\cache" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$CargoPath\registry\src" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$CargoPath\git\db" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "✓ Cargo Cache cleaned." -ForegroundColor Green
}

# 6. Conda Cache
if (Get-Command conda -ErrorAction SilentlyContinue) {
    Write-Host "Cleaning Conda Packages & Caches..." -ForegroundColor Yellow
    conda clean --all -y
    Write-Host "✓ Conda Cache cleaned." -ForegroundColor Green
}

Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "           Cleanup Complete!             " -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
