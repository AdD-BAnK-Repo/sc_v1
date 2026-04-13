# 📦 SC V1 - Scripts Collection

## 🚀 Quick Install

```bash
wget -q -O /usr/local/bin/alert https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/alert && chmod +x /usr/local/bin/alert
```

## 📜 Available Scripts

| Script | Description |
|--------|-------------|
| `alert` | Run command + Notification to phone |

## 🎙️ Alert Script

รันคำสั่ง + แจ้งเตือนไปมือถือผ่าน xdroid.net

### Install:
```bash
wget -q -O /usr/local/bin/alert https://raw.githubusercontent.com/PRIVATE-OBSIDIAN-NOTE/sc_v1/refs/heads/main/alert && chmod +x /usr/local/bin/alert
```

### Usage:
```bash
alert 'nvm i 22'
alert 'sudo apt update'
alert 'ollama list'
```

### ตัวอย่าง:
```bash
nohup sh -c "curl -fsSL https://ollama.com/install.sh | sh && ollama run gemma4:e2b && curl 'http://xdroid.net/api/message?k=k-6516aa1ef0c9&t=%E0%B9%81%E0%B8%88%E0%B9%89%E0%B8%87%E0%B9%80%E0%B8%95%E0%B8%B7%E0%B8%AD%E0%B8%99%E0%B8%88%E0%B8%B2%E0%B8%81%E0%B8%A3%E0%B8%B0%E0%B8%9A%E0%B8%9A&c=%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%94%E0%B8%B3%E0%B9%80%E0%B8%99%E0%B8%B4%E0%B8%99%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%A5%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%B8%E0%B8%94%E0%B9%80%E0%B8%AA%E0%B8%A3%E0%B9%87%E0%B8%88%E0%B8%AA%E0%B8%B4%E0%B9%89%E0%B8%99%E0%B9%81%E0%B8%A5%E0%B9%89%E0%B8%A7%E0%B9%82%E0%B8%9B%E0%B8%A3%E0%B8%94%E0%B8%95%E0%B8%A3%E0%B8%A7%E0%B8%88%E0%B8%AA%E0%B8%AD%E0%B8%9A&u='" > install_log.txt 2>&1 &
```

---

**Docs:** [Script-Pro Private Repo](https://github.com/PRIVATE-OBSIDIAN-NOTE/Script-Pro)