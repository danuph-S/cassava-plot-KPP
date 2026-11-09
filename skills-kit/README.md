# ชุดติดตั้งสกิล Claude Code (Skills Kit)

ชุดนี้รวมสกิลและปลั๊กอินที่ได้รับความนิยม มาจากแหล่งที่เชื่อถือได้ และผ่านการตรวจโค้ดเบื้องต้นแล้ว
ใช้กับ **Claude Code** บนเครื่องคอมพิวเตอร์ (Terminal, VS Code หรือแท็บ Code ใน Claude Desktop)
ตรวจสอบและทดลองติดตั้งเมื่อ พฤศจิกายน 2569

## ติดตั้งแบบเร็ว

1. ติดตั้ง Claude Code ก่อน: https://code.claude.com/docs
2. ดาวน์โหลดโฟลเดอร์ `skills-kit` นี้ (เช่น ดาวน์โหลด ZIP ของ repo จาก GitHub แล้วแตกไฟล์)
3. รันสคริปต์ตามระบบปฏิบัติการ

   **Windows** (PowerShell):
   ```powershell
   cd skills-kit
   powershell -ExecutionPolicy Bypass -File .\install-windows.ps1
   ```
   **macOS / Linux**:
   ```bash
   cd skills-kit
   bash install-mac-linux.sh
   ```
4. ปิดแล้วเปิด Claude Code ใหม่ แล้วพิมพ์ `/plugin` เพื่อดูรายการที่ติดตั้งแล้ว

ถ้าไม่ต้องการปลั๊กอินตัวไหน ให้ใส่ `#` หน้าบรรทัดนั้นใน `plugins.txt` ก่อนรันสคริปต์

## ติดตั้งเองทีละตัว (พิมพ์ใน Claude Code)

ติดตั้งแค่ **Superpowers** อย่างเดียว:
```
/plugin marketplace add anthropics/claude-plugins-official
/plugin install superpowers@claude-plugins-official
```

ติดตั้งทั้งหมด:
```
/plugin marketplace add anthropics/claude-plugins-official
/plugin install superpowers@claude-plugins-official
/plugin install frontend-design@claude-plugins-official
/plugin install skill-creator@claude-plugins-official
/plugin install playground@claude-plugins-official

/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
/plugin install example-skills@anthropic-agent-skills

/plugin marketplace add anthropics/knowledge-work-plugins
/plugin install data@knowledge-work-plugins
/plugin install productivity@knowledge-work-plugins
/plugin install design@knowledge-work-plugins

/plugin marketplace add nextlevelbuilder/ui-ux-pro-max-skill
/plugin install ui-ux-pro-max@ui-ux-pro-max-skill

/plugin marketplace add pbakaus/impeccable
/plugin install impeccable@impeccable

/plugin marketplace add Lum1104/Understand-Anything
/plugin install understand-anything@understand-anything

/plugin marketplace add bradautomates/claude-video
/plugin install watch@claude-video
```

สกิลภาษาไทยที่เตรียมไว้ในโฟลเดอร์ `custom-skills/` ให้คัดลอกไปไว้ที่ `~/.claude/skills/` (Windows: `C:\Users\<ชื่อ>\.claude\skills\`) ซึ่งสคริปต์ทำให้อัตโนมัติ

## ตารางสกิลตามงาน

| งาน | สกิล / ปลั๊กอิน | ผู้พัฒนา | หมายเหตุ |
|---|---|---|---|
| **เขียนโปรแกรม** | `superpowers` | obra (อยู่ใน marketplace ทางการของ Anthropic) | ระดมความคิด → เขียนแผน → TDD → debug → รีวิวโค้ด |
| | `frontend-design` | Anthropic | หน้าเว็บที่ดูไม่เหมือน AI ทำ |
| | `understand-anything` | Lum1104 | วิเคราะห์ codebase เป็นกราฟความรู้ |
| **ทำเว็บแอป** | `frontend-design`, `ui-ux-pro-max`, `impeccable`, `playground` | Anthropic / nextlevelbuilder / pbakaus | `playground` สร้างหน้าเว็บโต้ตอบได้ในไฟล์เดียว |
| **ออกแบบดีไซน์** | `ui-ux-pro-max`, `impeccable`, `design` | nextlevelbuilder / pbakaus / Anthropic | ระบบสี ฟอนต์ เลย์เอาต์ รีวิวงานออกแบบ |
| | `example-skills` (`canvas-design`, `theme-factory`, `algorithmic-art`) | Anthropic | โปสเตอร์ งานกราฟิก ธีมสี |
| **อินโฟกราฟิก** | `thai-infographic` ⭐ | ชุดนี้ | ทำเป็น HTML แล้วแปลงเป็น PNG ภาษาไทยจึงไม่เพี้ยน |
| | `canvas-design` | Anthropic | งานกราฟิก/โปสเตอร์ทั่วไป |
| **ทำ motion / วิดีโอแอนิเมชัน** | Remotion Agent Skills | Remotion (ทางการ) | ดูวิธีติดตั้งด้านล่าง |
| **แดชบอร์ด** | `data` (`build-dashboard`, `create-viz`) | Anthropic | แดชบอร์ด HTML จากไฟล์ CSV/Excel |
| **วิเคราะห์ข้อมูล / วางแผนวิเคราะห์** | `data-analysis-plan` ⭐, `data` (`analyze`, `statistical-analysis`) | ชุดนี้ / Anthropic | เลือกสถิติให้ตรงแผนการทดลอง (RCBD, ANOVA ฯลฯ) |
| **วางแผนงาน** | `superpowers` (`brainstorming`, `writing-plans`), `productivity` | obra / Anthropic | |
| **สรุปงาน** | `productivity`, `doc-coauthoring` | Anthropic | สรุปประชุม จัดการงาน |
| **ทำเอกสาร** | `document-skills` (`docx`, `pdf`, `pptx`, `xlsx`) | Anthropic | Word, PDF, PowerPoint, Excel |
| **หนังสือราชการไทย** | `thai-gov-letter` ⭐ | ชุดนี้ | หนังสือภายนอก บันทึกข้อความ คำสั่ง ประกาศ |
| **รายงานผลการดำเนินงานโครงการ** | `project-performance-report` ⭐ | ชุดนี้ | KPI, งบประมาณ, ปัญหาอุปสรรค, ข้อเสนอแนะ |
| **ดูวิดีโอ** (YouTube, TikTok, Facebook, X, ไฟล์ในเครื่อง) | `watch` (claude-video) | bradautomates | ดึงภาพนิ่ง + คำบรรยายให้ Claude วิเคราะห์ |

⭐ = สกิลภาษาไทยที่เขียนเพิ่มในชุดนี้ เพราะยังไม่พบสกิลบน GitHub ที่น่าเชื่อถือพอสำหรับงานเหล่านี้

### Motion graphics ด้วย Remotion

Remotion เป็นเฟรมเวิร์กสร้างวิดีโอด้วยโค้ด React สกิลของมันติดตั้ง **ต่อโปรเจกต์** ต้องมี Node.js:
```bash
npx create-video@latest my-video     # สร้างโปรเจกต์วิดีโอ
cd my-video
npx skills add remotion-dev/skills   # ติดตั้งสกิลของ Remotion
claude                               # เปิด Claude Code ในโฟลเดอร์นี้
```
จากนั้นสั่ง Claude ได้ เช่น "ทำวิดีโอแนะนำโครงการ 30 วินาที แนวตั้ง 1080×1920"
หมายเหตุ: Remotion ใช้ฟรีสำหรับบุคคลและองค์กรขนาดเล็ก แต่บริษัทขนาดใหญ่ต้องซื้อไลเซนส์ (ดู remotion.dev/license)

### ดูวิดีโอด้วย `watch`

- ต้องติดตั้ง `ffmpeg` และ `yt-dlp` (สกิลมีตัวช่วยตรวจตอนเรียกใช้ครั้งแรก)
- ถ้าวิดีโอมีคำบรรยายอยู่แล้ว จะใช้ได้ฟรีโดยไม่ต้องมี API key
- วิดีโอที่ไม่มีคำบรรยาย ต้องเลือกถอดเสียงอย่างใดอย่างหนึ่ง: WhisperX ในเครื่อง (ฟรีแต่ใช้ทรัพยากรเครื่อง) หรือ Groq/OpenAI API (ต้องมี key)
- ใช้ได้ใน Claude Code เท่านั้น ใช้ใน Claude Chat หรือ Cowork ไม่ได้
- ดูเฉพาะวิดีโอที่คุณมีสิทธิ์ใช้ และเคารพเงื่อนไขของแต่ละแพลตฟอร์ม

## ความปลอดภัย

แนวทางคัดเลือก:
1. **แหล่งที่มา**: เลือกจาก Anthropic (`anthropics/*`) และ marketplace ทางการก่อน รองลงมาเป็น repo ที่มีผู้ใช้มากและยังมีการพัฒนาอยู่
2. **ตรวจโค้ด**: เปิดดูสคริปต์และ hook ทุกตัวที่รันอัตโนมัติ
   - `watch` มี hook ตอนเปิด session ที่ตรวจว่าติดตั้งโปรแกรมครบหรือยัง มันแค่แสดงข้อความแนะนำ ไม่ส่งข้อมูลออกไปไหน มันติดต่อภายนอกเฉพาะตอนดาวน์โหลดวิดีโอ หรือตอนที่คุณเลือกใช้ API ถอดเสียง (Groq/OpenAI/Gemini)
   - `ui-ux-pro-max`, `impeccable`, `superpowers` เป็นคำแนะนำ (Markdown) กับสคริปต์ค้นหาข้อมูลในเครื่องเป็นหลัก
3. **ไม่ใส่ในชุดนี้**: สกิลที่ขึ้นต้นด้วย `danger-` หรือสกิลที่เลี่ยง API ทางการ (เช่น `baoyu-danger-gemini-web`), สกิลที่โพสต์โซเชียลอัตโนมัติ และสกิลจากเว็บรวมสกิลที่ไม่มี repo ต้นทางให้ตรวจ

ข้อควรปฏิบัติ:
- ก่อนติดตั้งสกิลใหม่จากที่อื่น ให้เปิดอ่าน `SKILL.md` และโฟลเดอร์ `scripts/` ก่อนทุกครั้ง
- อย่าใส่ API key ลงในไฟล์ที่ commit ขึ้น GitHub
- ปลั๊กอินที่ไม่ใช้แล้วให้ปิดไว้: `/plugin` → เลือก → Disable (ทุกปลั๊กอินที่เปิดอยู่ใช้ context เพิ่มขึ้นเล็กน้อย)

## ไฟล์ในชุดนี้

```
skills-kit/
├── README.md                 คู่มือนี้
├── plugins.txt               รายการปลั๊กอิน (แก้ไขได้)
├── install-windows.ps1       สคริปต์ติดตั้งสำหรับ Windows
├── install-mac-linux.sh      สคริปต์ติดตั้งสำหรับ macOS/Linux
└── custom-skills/
    ├── thai-gov-letter/            หนังสือราชการไทย
    ├── project-performance-report/ รายงานผลการดำเนินงานโครงการ
    ├── data-analysis-plan/         วางแผนวิเคราะห์ข้อมูล
    └── thai-infographic/           อินโฟกราฟิกภาษาไทย (+ scripts/render.py)
```

## แหล่งอ้างอิง

- Superpowers — https://github.com/obra/superpowers
- Anthropic Skills — https://github.com/anthropics/skills
- Anthropic Knowledge Work Plugins — https://github.com/anthropics/knowledge-work-plugins
- Claude Plugins Official — https://github.com/anthropics/claude-plugins-official
- UI UX Pro Max — https://github.com/nextlevelbuilder/ui-ux-pro-max-skill
- Impeccable — https://github.com/pbakaus/impeccable
- Understand Anything — https://github.com/Lum1104/Understand-Anything
- claude-video (`/watch`) — https://github.com/bradautomates/claude-video
- Remotion Agent Skills — https://github.com/remotion-dev/skills และ https://www.remotion.dev/docs/ai/skills
