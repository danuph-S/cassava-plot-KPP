# ติดตั้งชุดสกิลและปลั๊กอินสำหรับ Claude Code (Windows PowerShell)
# วิธีใช้:  powershell -ExecutionPolicy Bypass -File .\install-windows.ps1
$ErrorActionPreference = "Continue"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$Kit = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillsDir = Join-Path $HOME ".claude\skills"

Write-Host "== 1) ติดตั้งสกิลภาษาไทยที่เตรียมไว้ -> $SkillsDir"
New-Item -ItemType Directory -Force -Path $SkillsDir | Out-Null
Get-ChildItem -Directory (Join-Path $Kit "custom-skills") | ForEach-Object {
    $dest = Join-Path $SkillsDir $_.Name
    if (Test-Path $dest) { Write-Host "   ข้าม $($_.Name) (มีอยู่แล้ว)" }
    else { Copy-Item -Recurse $_.FullName $dest; Write-Host "   ติดตั้ง $($_.Name)" }
}

Write-Host "== 2) ติดตั้งปลั๊กอินตาม plugins.txt"
if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Host "   ไม่พบคำสั่ง claude — ติดตั้ง Claude Code ก่อน: https://code.claude.com/docs"
    Write-Host "   หรือพิมพ์คำสั่งใน README.md ทีละบรรทัดภายใน Claude Code"
    exit 0
}
$added = @{}
Get-Content -Encoding UTF8 (Join-Path $Kit "plugins.txt") | Where-Object { $_ -notmatch '^\s*(#|$)' } | ForEach-Object {
    $market, $plugin = ($_ -split '\s+', 2)
    $plugin = $plugin.Trim()
    if ($market -ne "-" -and -not $added.ContainsKey($market)) {
        claude plugin marketplace add $market
        $added[$market] = $true
    }
    claude plugin install $plugin
    if ($LASTEXITCODE -ne 0) { Write-Host "   ! ติดตั้ง $plugin ไม่สำเร็จ" }
}

Write-Host "== 3) โปรแกรมเสริม (ไม่บังคับ)"
if (-not (Get-Command ffmpeg -ErrorAction SilentlyContinue)) { Write-Host "   แนะนำ: winget install Gyan.FFmpeg  (สำหรับสกิลดูวิดีโอ)" }
if (-not (Get-Command yt-dlp -ErrorAction SilentlyContinue)) { Write-Host "   แนะนำ: winget install yt-dlp.yt-dlp  (ดูวิดีโอจากเว็บ)" }
Write-Host "   สำหรับ thai-infographic: pip install playwright ; playwright install chromium"

Write-Host "เสร็จแล้ว — ปิดแล้วเปิด Claude Code ใหม่ แล้วพิมพ์ /plugin เพื่อตรวจรายการ"
