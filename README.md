# 🔍 Linux User Audit Tool

A beginner-friendly, interactive Linux auditing tool designed to help cybersecurity learners and blue teamers quickly analyze user-related system files such as `/etc/passwd`, `/etc/shadow`, and `/etc/group`.

This tool supports:
- Real-time filtering
- Customizable searches
- Color-coded CLI output
- A simple and safe terminal UI

📌 Built with a focus on **Linux fundamentals**, this script is a learning project I created while preparing for:
- Google Cybersecurity Certificate
- CompTIA Security+ & Network+

---

## ✨ Features

- 🔹 Simple, beginner-friendly **CLI menu**
- 📁 Targeted **file selection** (choose any system file to audit)
- 🎯 Interactive **search & filter options**:
  - Username extraction
  - UID, GID, and shell info
  - Exclude `/bin/false` or `nologin`
  - User grouping by UID range
- 🎨 **Color-coded output** for better readability
- 🔄 Auto-loop with return to menu
- ⌨️ Exit anytime with a keypress
- 📂 Works with `/etc/passwd`, `/etc/shadow`, and `/etc/group`

---

## 🎥 Screenshots
![image](https://github.com/user-attachments/assets/8d1c57b1-e138-4c0d-93e6-e49c0e94cc19)

screenshot_main_menu.png



![image](https://github.com/user-attachments/assets/8bfdb735-24ce-43bd-b947-3eb32c01aa1a)

screenshot_output_example.png

---

## 🚀 Use Cases

| Role | Purpose |
|------|---------|
| 🔴 Red Team | Pre-enum & local recon on target systems |
| 🔵 Blue Team | Account validation, shell checks, config reviews |
| 🧑‍💻 SOC Analyst | Validate login shells, find misconfigs |
| 🎓 Beginners | Practice with `/etc/passwd`, `/etc/shadow` safely |

---

## ⚙️ How to Use

```bash
# Clone the repository
git clone https://github.com/rajkonkar/linux-user-audit-tool.git

# Navigate to the folder
cd linux-user-audit-tool

# Run the script (bash)
bash cybersec_file_audit_advanced.sh

🛠️ No dependencies required — pure Bash and color-coded using ANSI escape codes.

📌 Note

📌 Notes

    ✅ This script does not modify any files — read-only and beginner-safe

    🧠 Perfect for those learning Linux + Cybersecurity fundamentals

    🔐 Helps bridge CLI usage with real-world SOC/Red Team skills

🧑‍💻 Author

Made with ❤️ by Raj Konkar
🎯 Aspiring SOC Analyst | Blue Teamer | Red Teamer
📚 Currently learning and building weekly security projects
⭐ Contribute / Support

    ✨ Feel free to explore, use, or fork the tool!

    🚀 Planning to expand with log file analysis and bash script detection

    👀 Feedback and collaboration welcome!

📬 Reach me on https://www.linkedin.com/in/raj-konkar-b70b512a0/ | 📁 Repo: linux-user-audit-tool
