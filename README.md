# Ruby Dropbox File Automation

This project automates the processing and routing of uploaded files using the Dropbox API.

### ✅ What this automation does

- Detects new files uploaded into a Dropbox folder.
- Identifies file type based on prefix (e.g., `CUST`, `ORD`, `INV`).
- Cleans and transforms CSV content (dates, phone numbers, whitespace, etc.).
- Moves the transformed file to the appropriate destination folder.
- Deletes original files to maintain a clean Dropbox environment.

### 🛠️ Tech stack

| Component | Technology |
|----------|------------|
| Language | Ruby |
| API Client | Dropbox API |
| Scheduler | Cron / background worker |
| Output format | CSV transformation |

---

### 📁 Project structure

