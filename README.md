# Ruby Dropbox File Automation

This project automates the processing and routing of uploaded CSV files using the Dropbox API.  
It detects files, cleans/transforms data when needed, and moves them to the correct destination folder.

---

## ✅ What this automation does

- Connects to Dropbox using the Dropbox API.
- Detects new uploaded files in a configured folder.
- Identifies each file by its prefix (example: `CUST`, `ORD`, `INV`).
- Transforms CSV data:
  - Removes extra spaces / double quotes.
  - Validates and formats dates.
  - Fixes invalid phone numbers.
- Generates cleaned CSV files (`orders.csv`, `invoices.csv`, `customers.csv`).
- Uploads the processed file into the correct destination folder.
- Deletes the original file from Dropbox once processed.

---

## 📁 Project structure

´´´
/ruby_dropbox_file_automation
│── helpers/
│ ├── constants.rb # Folder mappings and CSV headers
│ ├── main.rb # Main logic to process files
│ └── scheduled_worker.rb # Background execution
│── config.yml.example # Editable configuration template
│── README.md

´´´
---


---

## 🛠️ Tech Stack

| Component | Technology |
|----------|------------|
| Language | Ruby |
| Integration | Dropbox API |
| File processing | CSV |
| Scheduling | Cron worker |
| Config | YAML |

---

## ⚙️ Configuration

Create your own configuration file from the template:

```bash
cp config.yml.example config.yml


