# 📦 SC V1 - Scripts Collection

## 🚀 ติดตั้ง (1 คำสั่ง!)

```bash
sudo wget -q -O /usr/local/bin/setup https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/setup && sudo chmod +x /usr/local/bin/setup && sudo setup
```

**สิ่งที่จะทำ:**
1. 📥 โหลด Scripts ทั้ง 5 ตัว
2. 📱 ถาม Bot Token, Chat ID, Xdroid Key (หรือกด Enter ใช้ค่าเริ่มต้น)
3. 🧪 ทดสอบส่งข้อความ

เสร็จแล้ว! ✅

---

## 📜 Scripts

| คำสั่ง | ช่องทาง |
|--------|----------|
| `notify` | Telegram |
| `xnotify` | xdroid |
| `alert` | Telegram realtime |
| `xalert` | xdroid realtime |

---

## 📱 วิธีใช้

```bash
# ส่งข้อความ
notify 'Server ทำงานปกติ'
xnotify 'Server ทำงานปกติ'

# รันคำสั่ง + แจ้งผล
alert 'apt list --upgradable'
xalert 'apt list --upgradable'
```

---

**Made with 🦞 by Airin**
**Repo:** https://github.com/PRIVATE-OBSIDIAN-NOTE/sc_v1