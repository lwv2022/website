# Legacy West Ventures: give LWV a command line on this PC over Tailscale, so the screen setup can be
# done and supported without anyone at the store. Authorized by Tony Garcia (LWV) 2026-11-01 for the
# Arise store end-TV PC. Run in an Administrator PowerShell (through RustDesk).
# It does three things: installs Tailscale and signs it in (a login link is shown; Tony opens it on his
# phone), turns on Windows' built-in OpenSSH server on the Tailscale address only, and authorizes LWV's
# public key for administrators.
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$Dir = 'C:\LWV'; New-Item -ItemType Directory -Force -Path $Dir | Out-Null
function Say($m) { $l = "$(Get-Date -Format 'HH:mm:ss')  $m"; Write-Host $l; Add-Content -Path "$Dir\lwv-access.log" -Value $l }
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) { throw 'Open PowerShell as Administrator (right-click, Run as administrator) and run this again.' }

# 1. Tailscale, signed in through a browser link (no key needed)
$ts = 'C:\Program Files\Tailscale\tailscale.exe'
if (-not (Test-Path $ts)) {
  Say 'Downloading Tailscale'
  Invoke-WebRequest -Uri 'https://pkgs.tailscale.com/stable/tailscale-setup-latest-amd64.msi' -OutFile "$Dir\tailscale.msi" -UseBasicParsing
  Say 'Installing Tailscale'
  Start-Process msiexec.exe -ArgumentList '/i', "$Dir\tailscale.msi", '/quiet', '/norestart' -Wait
  Start-Sleep -Seconds 5
}
$status = (& $ts status 2>&1 | Out-String)
if ($LASTEXITCODE -ne 0 -or $status -match 'Logged out|NeedsLogin|not logged in|stopped') {
  Say 'Tailscale needs to be signed in. A link will appear below: Tony opens it on his phone and approves.'
  Remove-Item "$Dir\ts-login.txt" -ErrorAction SilentlyContinue
  $p = Start-Process -FilePath $ts -ArgumentList 'up', '--unattended', '--hostname=arise-store-tv', '--accept-dns=false' -PassThru -NoNewWindow -RedirectStandardError "$Dir\ts-login.txt" -RedirectStandardOutput "$Dir\ts-login-out.txt"
  for ($i = 0; $i -lt 60; $i++) {
    Start-Sleep -Seconds 2
    $txt = ((Get-Content "$Dir\ts-login.txt" -ErrorAction SilentlyContinue) + (Get-Content "$Dir\ts-login-out.txt" -ErrorAction SilentlyContinue) | Out-String)
    if ($txt -match 'https://login\.tailscale\.com/a/[A-Za-z0-9]+') { Say ("OPEN THIS LINK ON TONY'S PHONE:  " + $Matches[0]); break }
  }
  $p.WaitForExit(600000) | Out-Null
}
$tsIp = (& $ts ip -4 2>$null | Select-Object -First 1)
if (-not $tsIp) { throw 'Tailscale did not sign in. Run this again once Tony has approved the link.' }
Say "Tailscale IP: $tsIp"

# 2. Windows OpenSSH server, listening only on the Tailscale address, keys only
$cap = Get-WindowsCapability -Online -Name 'OpenSSH.Server*' | Select-Object -First 1
if ($cap.State -ne 'Installed') { Say 'Installing OpenSSH Server'; Add-WindowsCapability -Online -Name $cap.Name | Out-Null }
Set-Service -Name sshd -StartupType Automatic
New-Item -Path 'HKLM:\SOFTWARE\OpenSSH' -Force | Out-Null
New-ItemProperty -Path 'HKLM:\SOFTWARE\OpenSSH' -Name DefaultShell -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe' -PropertyType String -Force | Out-Null
$cfg = 'C:\ProgramData\ssh\sshd_config'
if (-not (Test-Path $cfg)) { Start-Service sshd; Start-Sleep -Seconds 3; Stop-Service sshd }
# these two must sit at the TOP: the stock file ends with a "Match Group administrators" block, and
# ListenAddress is not allowed inside a Match block (sshd then refuses to start)
$rest = @(Get-Content $cfg | Where-Object { $_ -notmatch '^\s*(ListenAddress|PasswordAuthentication)\s' })
Set-Content -Path $cfg -Value (@("ListenAddress $tsIp", 'PasswordAuthentication no') + $rest) -Encoding ascii

# 3. LWV's key for administrators
$keyFile = 'C:\ProgramData\ssh\administrators_authorized_keys'
$key = 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKoNapW12xcid4WzwjpuJ/BPSOzF19vwK7/1N662qsiT lwv2020-wsl-to-gcu-manager'
if (-not (Test-Path $keyFile) -or -not (@(Get-Content $keyFile) -contains $key)) { Add-Content -Path $keyFile -Value $key -Encoding ascii }
icacls $keyFile /inheritance:r /grant 'Administrators:F' /grant 'SYSTEM:F' | Out-Null
Stop-Service sshd -ErrorAction SilentlyContinue; Start-Service sshd
Start-Sleep -Seconds 2
if ((Get-Service sshd).Status -ne 'Running') { throw 'sshd did not start; send Tony a screenshot' }
if (-not (Get-NetFirewallRule -DisplayName 'LWV OpenSSH on Tailscale' -ErrorAction SilentlyContinue)) {
  New-NetFirewallRule -DisplayName 'LWV OpenSSH on Tailscale' -Direction Inbound -Protocol TCP -LocalPort 22 -LocalAddress $tsIp -Action Allow -Profile Any | Out-Null
}
Say "OpenSSH ready on $tsIp for user $env:USERNAME"
Say 'Done. Tony can take it from here.'
