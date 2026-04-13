# 📦 SC V1 - Scripts Collection

> 🎙️ Scripts สำหรับแจ้งเตือน + รันคำสั่ง

## 🚀 Quick Install

```bash
# 1. โหลด Scripts
cd /tmp
wget -q -O setup https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/setup
wget -q -O notify https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/notify
wget -q -O xnotify https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/xnotify
wget -q -O alert https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/alert
wget -q -O xalert https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/xalert

# 2. ติดตั้ง
chmod +x setup notify xnotify alert xalert
sudo mv setup /usr/local/bin/
sudo mv notify xnotify alert xalert /usr/local/bin/

# 3. ตั้งค่าครั้งแรก (จะถาม Bot Token, Chat ID, Xdroid API Key)
sudo setup
```

## 📜 Scripts

| Script | ช่องทาง | คำอธิบาย |
|--------|----------|-----------|
| `notify` | Telegram | ส่งข้อความไป Telegram |
| `xnotify` | xdroid | ส่งข้อความไป xdroid |
| `alert` | Telegram | รันคำสั่ง + รายงาน Realtime → Telegram |
| `xalert` | xdroid | รันคำสั่ง + รายงาน Realtime → xdroid |
| `setup` | - | ตั้งค่าครั้งแรก |

## 📱 วิธีใช้

```bash
# ส่งข้อความ
notify 'Server ทำงานปกติ'
xnotify 'Server ทำงานปกติ'

# รันคำสั่ง + แจ้งผล
alert 'apt list --upgradable'
xalert 'apt list --upgradable'

# รันหลายคำสั่ง
alert 'df -h && free -h'
```

## ⚙️ ตั้งค่าครั้งแรก

```bash
sudo setup
# ป้อน:
# - Bot Token (Telegram)
# - Chat ID
# - Xdroid API Key
```

## 📝 ตัวอย่างการใช้งาน

```bash
# รีสตาร์ท Gateway
openclaw gateway restart && notify 'Gateway restart เสร็จ'

# อัปเดตระบบ
sudo apt update && alert 'apt update'
alert 'sudo apt upgrade -y'

# ตรวจสอบ Service
alert 'systemctl status nginx'
xalert 'systemctl status nginx'
```

---

**Docs:** [Script-Pro](https://github.com/PRIVATE-OBSIDIAN-NOTE/Script-Pro)
**Made with 🦞 by Airin**