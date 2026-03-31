#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Anvi Vajpayee | Reg: 24BCE11447
# Description: Audits key system directories for permissions
#              and disk usage, then checks VLC config location.

# --- Array of directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/share")

echo "============================================================"
echo "   Directory Audit Report"
printf "%-25s %-20s %-10s\n" "Directory" "Permissions/Owner" "Size"
echo "------------------------------------------------------------"

# --- For loop: iterate over each directory ---
for DIR in "${DIRS[@]}"; do

    # Check if directory exists before trying to inspect it
    if [ -d "$DIR" ]; then

        # Extract permissions, owner, and group using ls and awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3 "/" $4}')

        # Get human-readable size; suppress permission errors with 2>/dev/null
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted row
        printf "%-25s %-20s %-10s\n" "$DIR" "$PERMS ($OWNER)" "${SIZE:-N/A}"

    else
        # Directory not present on this system
        printf "%-25s %-20s\n" "$DIR" "** Does not exist **"
    fi

done

echo "============================================================"
echo ""

# --- Bonus: Check VLC-specific config directory ---
VLC_CONFIG_DIR="$HOME/.config/vlc"

echo "  VLC Configuration Check:"
echo "  -------------------------"

if [ -d "$VLC_CONFIG_DIR" ]; then
    echo "  VLC config dir found: $VLC_CONFIG_DIR"
    VLC_PERMS=$(ls -ld "$VLC_CONFIG_DIR" | awk '{print $1, $3, $4}')
    VLC_SIZE=$(du -sh "$VLC_CONFIG_DIR" 2>/dev/null | cut -f1)
    echo "  Permissions : $VLC_PERMS"
    echo "  Size        : ${VLC_SIZE:-N/A}"
    echo ""
    echo "  Configuration files inside:"
    # List contents, limit to 10 entries
    ls "$VLC_CONFIG_DIR" 2>/dev/null | head -10 | while read -r f; do
        echo "    - $f"
    done
else
    echo "  VLC config directory ($VLC_CONFIG_DIR) not found."
    echo "  VLC may not have been run yet, or may use Snap/Flatpak sandboxing."
fi

echo ""
echo "============================================================"
