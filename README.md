# OSS Audit — Python Programming Language

**Student Name:** Anvi Vajpayee
**Registration Number:** 24BCE11447
**Course:** Open Source Software (OSS NGMC)
**Repository:** `oss-audit-[rollnumber]`

---

## Chosen Software: Python

Python is a high-level, general-purpose programming language released under the **Python Software Foundation License v2 (PSF-2.0)** — a permissive open-source license compatible with the GPL. Created by Guido van Rossum and first released in 1991, Python is today the world's most widely used programming language, powering everything from web applications to machine learning pipelines.

---

## Repository Structure

```
oss-audit-[rollnumber]/
├── README.md                          ← This file
├── report/
│   └── OSS_Python_Audit_Report.pdf   ← Full 12–16 page report
└── scripts/
    ├── script1_system_identity.sh    ← System Identity Report
    ├── script2_package_inspector.sh  ← FOSS Package Inspector
    ├── script3_disk_auditor.sh       ← Disk and Permission Auditor
    ├── script4_log_analyzer.sh       ← Log File Analyzer
    └── script5_manifesto.sh          ← Open Source Manifesto Generator
```

---

## Scripts

### Script 1 — System Identity Report
**File:** `scripts/script1_system_identity.sh`

Displays a formatted welcome screen showing: Linux distribution name, kernel version, current user, home directory, system uptime, current date/time, and the open-source licenses covering the OS and Python.

**Concepts:** Variables, `echo`, command substitution `$()`, output formatting, `/etc/os-release`

**Run:**
```bash
chmod +x scripts/script1_system_identity.sh
./scripts/script1_system_identity.sh
```

---

### Script 2 — FOSS Package Inspector
**File:** `scripts/script2_package_inspector.sh`

Checks whether Python 3 is installed on the system, retrieves its version and description via `dpkg` or `rpm`, and uses a `case` statement to print an open-source philosophy note about the package.

**Concepts:** `if-then-else`, `case` statement, `dpkg -l` / `rpm -qi`, pipe with `grep`, `awk`

**Run:**
```bash
chmod +x scripts/script2_package_inspector.sh
./scripts/script2_package_inspector.sh
```

**Dependencies:** `dpkg` (Debian/Ubuntu) **or** `rpm` (Fedora/RHEL). At least one must be present.

---

### Script 3 — Disk and Permission Auditor
**File:** `scripts/script3_disk_auditor.sh`

Loops through important system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/usr/lib`, `/opt`) and reports the permissions, owner:group, and disk usage for each. Also checks for Python library directories specifically.

**Concepts:** `for` loop, bash arrays, `[ -d ]` directory check, `ls -ld`, `du -sh`, `awk`, glob expansion

**Run:**
```bash
chmod +x scripts/script3_disk_auditor.sh
./scripts/script3_disk_auditor.sh
```

---

### Script 4 — Log File Analyzer
**File:** `scripts/script4_log_analyzer.sh`

Reads a log file line by line, counts how many lines contain a given keyword (default: `error`), and prints the last 5 matching lines. Includes a retry mechanism if the file is empty.

**Concepts:** `while read` loop, `if-then`, counter variables, `$1`/`$2` arguments, `grep`, `tail`, `exit`

**Run:**
```bash
chmod +x scripts/script4_log_analyzer.sh

# Analyse /var/log/syslog for 'error' (default keyword)
./scripts/script4_log_analyzer.sh /var/log/syslog

# Analyse with a custom keyword
./scripts/script4_log_analyzer.sh /var/log/syslog warning

# On Ubuntu, syslog may be at:
./scripts/script4_log_analyzer.sh /var/log/syslog error

# Or try:
./scripts/script4_log_analyzer.sh /var/log/kern.log error
```

**Dependencies:** `grep`, `tail` (standard on all Linux systems)

---

### Script 5 — Open Source Manifesto Generator
**File:** `scripts/script5_manifesto.sh`

Interactively asks the user three questions and composes a personalised open-source philosophy statement. Saves the output to `manifesto_<username>.txt` and displays it on screen.

**Concepts:** `read` for user input, string concatenation, file redirection (`>` and `>>`), `date`, `cat`, alias concept (demonstrated via comment)

**Run:**
```bash
chmod +x scripts/script5_manifesto.sh
./scripts/script5_manifesto.sh
```

The script will prompt:
1. Name one open-source tool you use every day
2. In one word, what does 'freedom' mean to you?
3. Name one thing you would build and share freely

Output is saved to: `manifesto_<yourusername>.txt`

---

## How to Run All Scripts (Quick Setup)

```bash
# Clone the repository
git clone https://github.com/[yourusername]/oss-audit-[rollnumber].git
cd oss-audit-[rollnumber]

# Make all scripts executable at once
chmod +x scripts/*.sh

# Run each script
./scripts/script1_system_identity.sh
./scripts/script2_package_inspector.sh
./scripts/script3_disk_auditor.sh
./scripts/script4_log_analyzer.sh /var/log/syslog error
./scripts/script5_manifesto.sh
```

---

## Dependencies

| Tool | Purpose | How to Install |
|------|---------|---------------|
| `bash` | Shell interpreter for all scripts | Pre-installed on all Linux systems |
| `python3` | Inspected in Script 2 | `sudo apt install python3` |
| `dpkg` or `rpm` | Package inspection in Script 2 | Pre-installed on Debian/RPM systems |
| `coreutils` | `du`, `ls`, `cut`, `awk`, `tail` | Pre-installed on all Linux systems |
| `grep` | Keyword search in Script 4 | Pre-installed on all Linux systems |

All scripts are written in **POSIX-compatible Bash** and have been tested on **Ubuntu 22.04 LTS** and **Fedora 38**.

---

## Report

The full project report (`OSS_Python_Audit_Report.pdf`) is located in the `report/` directory. It covers:

- **Part A** — Origin and Philosophy (Python's creation story, PSF License analysis, ethical reflection)
- **Part B** — Linux Footprint (installation, directories, user/group, service management, update model)
- **Part C** — The FOSS Ecosystem (dependencies, derivatives, web stack, community governance)
- **Part D** — Open Source vs Proprietary (comparison with MATLAB, verdict and recommendation)
- **Scripts Documentation** — code, explanation, and concepts for all 5 scripts

---

## References

- Python Software Foundation — [python.org](https://python.org)
- PSF License — [python.org/psf/license](https://python.org/psf/license)
- CPython Source Code — [github.com/python/cpython](https://github.com/python/cpython)
- GNU Free Software Definition — [gnu.org/philosophy/free-sw.html](https://gnu.org/philosophy/free-sw.html)
- Open Source Initiative — [opensource.org](https://opensource.org)
- The Linux Command Line — [linuxcommand.org](https://linuxcommand.org)
- GNU Bash Manual — [gnu.org/software/bash/manual](https://gnu.org/software/bash/manual)
