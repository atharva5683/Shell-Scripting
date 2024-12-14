
# Day 06: Creating a Production Backup Rotation Script

In this session, we will be creating a **Production Backup Rotation Script** to automate backup creation and ensure that only the latest 5 backups are retained. This helps manage disk space efficiently and keeps backup data consistent.

---

## Objectives

- Understand the structure of a backup rotation script.
- Automate backup creation and rotation using shell scripting.
- Implement error handling and retention policies.

---

## Tasks

1. **Review** the existing data you want to back up.
2. **Write** the `backup.sh` script to:
   - Create a timestamped backup.
   - Retain the latest 5 backups.
3. **Test** the script to ensure it creates backups and deletes older backups correctly.
4. **Submit** the script and any relevant documentation.

---

## Prerequisites

- Familiarity with basic shell scripting and commands.
- A working environment with `zip` installed.
- Access to the source and backup directories.

---

## Learning Outcomes

- **Automate Backup Creation** with Shell Scripting.
- **Implement Backup Rotation Policies** to manage disk space.
- **Improve Automation Workflows** with Scheduling Tools like `cron`.

Let's get started!
