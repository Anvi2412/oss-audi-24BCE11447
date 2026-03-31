#!/bin/bash
# Script 1: System Identity Report
# Author: Anvi Vajpayee | Reg: 24BCE11447
# Course: Open Source Software
# Description: Displays a formatted system identity report
#              as a welcome screen for the open-source audit.

# --- Variables ---
STUDENT_NAME="Anvi Vajpayee"         # Student name
REG_NUMBER="24BCE11447"              # Registration number
SOFTWARE_CHOICE="VLC Media Player"   # Chosen open-source software

# --- Gather system information using command substitution ---
KERNEL=$(uname -r)                   # Current kernel version
USER_NAME=$(whoami)                  # Currently logged-in user
HOME_DIR=$(echo $HOME)               # Home directory of current user
UPTIME=$(uptime -p)                  # Human-readable uptime
DATETIME=$(date '+%A, %d %B %Y — %H:%M:%S')  # Formatted date and time

# Detect Linux distribution name from /etc/os-release
DISTRO=$(grep -oP '(?<=^PRETTY_NAME=").+(?=")' /etc/os-release 2>/dev/null \
         || echo "Unknown Distribution")

# --- Display formatted output ---
echo "============================================================"
echo "   OPEN SOURCE AUDIT — System Identity Report"
echo "============================================================"
echo ""
echo "  Student       : $STUDENT_NAME ($REG_NUMBER)"
echo "  Software      : $SOFTWARE_CHOICE"
echo "------------------------------------------------------------"
echo "  Distribution  : $DISTRO"
echo "  Kernel        : $KERNEL"
echo "  Logged-in as  : $USER_NAME"
echo "  Home Directory: $HOME_DIR"
echo "  System Uptime : $UPTIME"
echo "  Date & Time   : $DATETIME"
echo "------------------------------------------------------------"
echo ""
echo "  OS Licence Note:"
echo "  The Linux kernel powering this system is licenced under"
echo "  the GNU General Public Licence v2 (GPL v2)."
echo "  You are free to run, study, modify, and redistribute it."
echo ""
echo "============================================================"
