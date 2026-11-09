#!/usr/bin/env bash
# ติดตั้งชุดสกิลและปลั๊กอินสำหรับ Claude Code (macOS / Linux)
# วิธีใช้:  bash install-mac-linux.sh
set -u
KIT="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$HOME/.claude/skills"

echo "== 1) ติดตั้งสกิลภาษาไทยที่เตรียมไว้ -> $SKILLS_DIR"
mkdir -p "$SKILLS_DIR"
for s in "$KIT"/custom-skills/*/; do
  name="$(basename "$s")"
  if [ -e "$SKILLS_DIR/$name" ]; then
    echo "   ข้าม $name (มีอยู่แล้ว)"
  else
    cp -R "$s" "$SKILLS_DIR/$name" && echo "   ติดตั้ง $name"
  fi
done

echo "== 2) ติดตั้งปลั๊กอินตาม plugins.txt"
if ! command -v claude >/dev/null 2>&1; then
  echo "   ไม่พบคำสั่ง claude — ติดตั้ง Claude Code ก่อน: https://code.claude.com/docs"
  echo "   หรือพิมพ์คำสั่งใน README.md ทีละบรรทัดภายใน Claude Code"
  exit 0
fi
added=" "
grep -vE '^\s*(#|$)' "$KIT/plugins.txt" | while read -r market plugin; do
  if [ "$market" != "-" ] && [[ "$added" != *" $market "* ]]; then
    claude plugin marketplace add "$market" || echo "   ! เพิ่ม marketplace $market ไม่สำเร็จ"
    added="$added$market "
  fi
  claude plugin install "$plugin" || echo "   ! ติดตั้ง $plugin ไม่สำเร็จ"
done

echo "== 3) โปรแกรมเสริม (ไม่บังคับ)"
command -v ffmpeg >/dev/null 2>&1 || echo "   แนะนำติดตั้ง ffmpeg สำหรับสกิลดูวิดีโอ (mac: brew install ffmpeg)"
command -v yt-dlp >/dev/null 2>&1 || echo "   แนะนำติดตั้ง yt-dlp สำหรับดูวิดีโอจากเว็บ (pipx install yt-dlp)"
python3 -c "import playwright" >/dev/null 2>&1 || echo "   แนะนำติดตั้ง playwright สำหรับ thai-infographic (pip install playwright && playwright install chromium)"

echo "เสร็จแล้ว — ปิดแล้วเปิด Claude Code ใหม่ แล้วพิมพ์ /plugin เพื่อตรวจรายการ"
