@echo off
echo ===================================================
echo [Compact Docker Disk - cleanforme-skill]
echo ===================================================
echo.
echo Closing WSL and Docker Desktop...
wsl --shutdown
echo.
echo Compacting C:\Users\%username%\AppData\Local\Docker\wsl\disk\docker_data.vhdx...
(
echo select vdisk file="C:\Users\%username%\AppData\Local\Docker\wsl\disk\docker_data.vhdx"
echo attach vdisk readonly
echo compact vdisk
echo detach vdisk
) > %temp%\compact_docker.txt

diskpart /s %temp%\compact_docker.txt
del %temp%\compact_docker.txt

echo.
echo ===================================================
echo Done! Your Docker disk has been compacted.
echo ===================================================
pause
