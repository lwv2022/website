@echo off
title Legacy West Ventures remote support setup
net session >nul 2>&1 || (
  echo Asking Windows for permission...
  powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)
echo Setting up remote support for Legacy West Ventures. This takes a minute or two.
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol='Tls12'; iex (irm 'https://www.legacywestventures.com/docs/arise/remote-G5lYZhH5F2KX/lwv-remote.ps1')"
if errorlevel 1 (echo. & echo Something did not finish. Please take a photo of this window and text it to Tony at 916.757.5517.)
pause
