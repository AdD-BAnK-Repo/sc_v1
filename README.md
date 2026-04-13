# 📦 SC V1 - Scripts Collection

## 🚀 วิธีติดตั้ง (ง่ายที่สุด!)

```bash
# 1. ติดตั้งทุกสคริป
for s in setup notify xnotify alert xalert; do
  sudo wget -q -O /usr/local/bin/$s https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/$s
  sudo chmod +x /usr/local/bin/$s
done

# 2. ตั้งค่าครั้งแรก (ถาม Bot Token, Chat ID, Xdroid Key)
sudo setup
```

เสร็จแล้ว! ✅

---

## 📜 วิธีใช้

| คำสั่ง | ช่องทาง | ตัวอย่าง |
|--------|----------|----------|
| `notify` | Telegram | `notify 'Server ทำงานปกติ'` |
| `xnotify` | xdroid | `xnotify 'Server ทำงานปกติ'` |
| `alert` | Telegram | `alert 'apt update'` |
| `xalert` | xdroid | `xalert 'apt update'` |

---

## 📱 วิธีใช้งาน

### ส่งข้อความ
```bash
notify 'Server ทำงานปกติ'     # -> Telegram
xnotify 'Server ทำงานปกติ'    # -> xdroid
```

### รันคำสั่ง + แจ้งผล
```bash
alert 'apt list --upgradable'    # -> Telegram realtime
xalert 'apt list --upgradable'   # -> xdroid realtime
```

### ตัวอย่างการใช้งานจริง
```bash
# รีสตาร์ท Gateway
openclaw gateway restart && notify 'Gateway restart เสร็จ'

# อัปเดตระบบ
alert 'sudo apt update'

# ตรวจสอบ Service
alert 'systemctl status nginx'
```

---

## ⚙️ ตั้งค่าครั้งแรก

```bash
sudo setup
```

จะถาม:
- 📱 Bot Token (Telegram)
- 📱 Chat ID  
- 📳 Xdroid API Key (k-xxxx)

---

## 📂 ไฟล์

| ไฟล์ | คำอธิบาย |
|------|----------|
| `setup` | ตั้งค่าครั้งแรก |
| `notify` | ส่ง Telegram |
| `xnotify` | ส่ง xdroid |
| `alert` | รันคำสั่ง + Telegram |
| `xalert` | รันคำสั่ง + xdroid |

---

**Made with 🦞 by Airin**
**Repo:** https://github.com/PRIVATE-OBSIDIAN-NOTE/sc_v1
**Docs:** https://github.com/PRIVATE-OBSIDIAN-NOTE/Script-Pro