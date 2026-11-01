# Legacy West Ventures remote-support setup for the Arise store end-TV mini PC.
# Installs Tailscale (joins the LWV tailnet with a single-use key) and RustDesk (unattended,
# direct-IP access over Tailscale). The RustDesk password is generated on this PC and shown at the
# end for the store to text to LWV; nothing secret is stored in this file except the one-time key.
# Idempotent: safe to run twice. Log: C:\LWV\lwv-remote.log
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$AuthKey   = 'TSKEY_PLACEHOLDER'         # Tailscale: pre-authorized, tag:arise-store, single use, 7-day expiry
$HostName  = 'arise-store-tv'
$RdVersion = '1.5.0'
$RdUrl     = "https://github.com/rustdesk/rustdesk/releases/download/$RdVersion/rustdesk-$RdVersion-x86_64.msi"
$TsUrl     = 'https://pkgs.tailscale.com/stable/tailscale-setup-latest-amd64.msi'
$Dir = 'C:\LWV'; New-Item -ItemType Directory -Force -Path $Dir | Out-Null
$Log = "$Dir\lwv-remote.log"
function Say($m) { $l = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')  $m"; Write-Host $l; Add-Content -Path $Log -Value $l }
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) { throw 'Please run this as Administrator (right-click, Run as administrator).' }
Say "Starting on $env:COMPUTERNAME ($((Get-CimInstance Win32_OperatingSystem).Caption))"

# 1. Keep the screens on: never sleep, never blank the display (it is a TV wall)
powercfg /change standby-timeout-ac 0 | Out-Null
powercfg /change monitor-timeout-ac 0 | Out-Null
powercfg /change hibernate-timeout-ac 0 | Out-Null
Say 'Power: sleep and display timeout set to never'

# 2. Tailscale
$ts = 'C:\Program Files\Tailscale\tailscale.exe'
if (-not (Test-Path $ts)) {
  Say 'Downloading Tailscale'
  Invoke-WebRequest -Uri $TsUrl -OutFile "$Dir\tailscale.msi" -UseBasicParsing
  Say 'Installing Tailscale'
  Start-Process msiexec.exe -ArgumentList '/i', "$Dir\tailscale.msi", '/quiet', '/norestart' -Wait
  Start-Sleep -Seconds 5
}
$status = (& $ts status 2>&1 | Out-String)
if ($LASTEXITCODE -ne 0 -or $status -match 'Logged out|NeedsLogin|not logged in|stopped') {
  if ($AuthKey -eq 'TSKEY_PLACEHOLDER') { throw 'Tailscale key not set in this script yet.' }
  Say 'Joining the LWV network'
  & $ts up --authkey=$AuthKey --hostname=$HostName --unattended --accept-dns=false 2>&1 | ForEach-Object { Say "  tailscale: $_" }
} else { Say 'Tailscale already connected; leaving it alone' }
$tsIp = (& $ts ip -4 2>$null | Select-Object -First 1)
Say "Tailscale IP: $tsIp"

# 3. RustDesk, unattended, reachable by direct IP over Tailscale
$rd = 'C:\Program Files\RustDesk\rustdesk.exe'
if (-not (Test-Path $rd)) {
  Say 'Downloading RustDesk'
  Invoke-WebRequest -Uri $RdUrl -OutFile "$Dir\rustdesk.msi" -UseBasicParsing
  Say 'Installing RustDesk'
  Start-Process msiexec.exe -ArgumentList '/i', "$Dir\rustdesk.msi", '/quiet', '/norestart' -Wait
  Start-Sleep -Seconds 8
}
$cfgDir = 'C:\Windows\ServiceProfiles\LocalService\AppData\Roaming\RustDesk\config'
New-Item -ItemType Directory -Force -Path $cfgDir | Out-Null
$cfg = "$cfgDir\RustDesk2.toml"
$want = [ordered]@{ 'direct-server' = 'Y'; 'direct-access-port' = '21118'; 'verification-method' = 'use-permanent-password'; 'approve-mode' = 'password' }
$lines = @(); if (Test-Path $cfg) { $lines = @(Get-Content $cfg) }
if (-not ($lines -match '^\[options\]')) { $lines += '[options]' }
foreach ($k in $want.Keys) {
  $lines = @($lines | Where-Object { $_ -notmatch "^$k\s*=" })
  $i = [Array]::IndexOf($lines, '[options]')
  $tail = @(); if ($i + 1 -lt $lines.Count) { $tail = $lines[($i + 1)..($lines.Count - 1)] }
  $lines = @($lines[0..$i]) + @("$k = '$($want[$k])'") + $tail
}
Set-Content -Path $cfg -Value $lines -Encoding UTF8
Say 'RustDesk: direct IP access on, permanent password mode'
# a fresh password made here, never stored anywhere but this PC
$alphabet = [char[]]('abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789')
$RdPass = -join (1..12 | ForEach-Object { $alphabet[(Get-Random -Maximum $alphabet.Length)] })
Start-Service -Name RustDesk -ErrorAction SilentlyContinue
Start-Sleep -Seconds 3
& $rd --password $RdPass 2>&1 | Out-Null
Restart-Service -Name RustDesk -ErrorAction SilentlyContinue
Start-Sleep -Seconds 3
$rdId = (& $rd --get-id 2>$null | Out-String).Trim()
if (-not (Get-NetFirewallRule -DisplayName 'LWV RustDesk direct' -ErrorAction SilentlyContinue)) {
  New-NetFirewallRule -DisplayName 'LWV RustDesk direct' -Direction Inbound -Program $rd -Action Allow -Profile Any | Out-Null
}
Say "RustDesk ID: $rdId"

# 4. Leave a note on this PC and show the person what to text to LWV
$info = "LWV remote support installed $(Get-Date)`r`nComputer: $env:COMPUTERNAME`r`nTailscale IP: $tsIp`r`nRustDesk ID: $rdId`r`nRustDesk password: $RdPass`r`n"
Set-Content -Path "$Dir\remote-info.txt" -Value $info
Say 'Done'
Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show("All set.`n`nPlease text this code to Tony at 916.757.5517:`n`n    $RdPass`n`nIt is also saved in C:\LWV\remote-info.txt. You can close this window.", 'Legacy West Ventures', 'OK', 'Information') | Out-Null
