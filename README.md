# 📦 SC V1 - Scripts Collection

## 🚀 Quick Install

```bash
wget -q -O /usr/local/bin/alert https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/alert && chmod +x /usr/local/bin/alert
wget -q -O /usr/local/bin/notify https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/notify && chmod +x /usr/local/bin/notify
```

## 📜 Available Scripts

| Script | Description |
|--------|-------------|
| `alert` | Run command + AI Summary + Notification |
| `notify` | ส่งแจ้งเตือนไปมือถือ |

## 🎙️ Alert Script

รันคำสั่ง + AI สรุป + แจ้งเตือนไปมือถือ

### Usage:
```bash
alert 'ls -la'
alert 'sudo apt update'
alert 'ollama list'
```

## 📱 Notify Script

ส่งแจ้งเตือนไปมือถือ (ไม่รันคำสั่ง)

### Usage:
```bash
notify 'Server ทำงานปกติ'
notify 'กำลังติดตั้ง...'
```

---

**Docs:** [Script-Pro Private Repo](https://github.com/PRIVATE-OBSIDIAN-NOTE/Script-Pro)