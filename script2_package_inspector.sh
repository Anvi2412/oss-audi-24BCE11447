#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Anvi Vajpayee | Reg: 24BCE11447
# Description: Checks if an OSS package is installed and
#              prints metadata plus a philosophy note.

# The package to inspect (change as needed)
PACKAGE="vlc"

echo "========================================"
echo "  FOSS Package Inspector"
echo "========================================"
echo ""

# --- Detect which package manager is available ---
if command -v dpkg &>/dev/null; then
    PKG_MANAGER="dpkg"
elif command -v rpm &>/dev/null; then
    PKG_MANAGER="rpm"
else
    echo "No supported package manager found."
    exit 1
fi

# --- Check if the package is installed ---
if [ "$PKG_MANAGER" = "dpkg" ]; then
    if dpkg -l "$PACKAGE" 2>/dev/null | grep -q "^ii"; then
        INSTALLED=true
        # Extract version and description using grep and awk
        VERSION=$(dpkg -l "$PACKAGE" | grep "^ii" | awk '{print $3}')
        DESCRIPTION=$(dpkg -l "$PACKAGE" | grep "^ii" | awk '{$1=$2=$3=$4=""; print $0}' | xargs)
    else
        INSTALLED=false
    fi
else
    if rpm -q "$PACKAGE" &>/dev/null; then
        INSTALLED=true
        VERSION=$(rpm -qi "$PACKAGE" | grep "^Version" | awk '{print $3}')
        DESCRIPTION=$(rpm -qi "$PACKAGE" | grep "^Summary" | cut -d: -f2 | xargs)
    else
        INSTALLED=false
    fi
fi

# --- Display result based on installation status ---
if [ "$INSTALLED" = true ]; then
    echo "  Status      : INSTALLED"
    echo "  Package     : $PACKAGE"
    echo "  Version     : $VERSION"
    echo "  Description : $DESCRIPTION"
else
    echo "  Status      : NOT INSTALLED"
    echo "  Package     : $PACKAGE"
    echo ""
    echo "  To install on Ubuntu/Debian: sudo apt install $PACKAGE"
    echo "  To install on Fedora/RHEL  : sudo dnf install $PACKAGE"
fi

echo ""
echo "  --- Philosophy Note ---"

# --- Case statement: print a philosophy note per package ---
case "$PACKAGE" in
    vlc)
        echo "  VLC: Built by students in Paris, now plays anything" ;;
    firefox)
        echo "  Firefox: A nonprofit fighting for an open web" ;;
    git)
        echo "  Git: The tool Linus built when proprietary failed him" ;;
    python3|python)
        echo "  Python: A language shaped entirely by its community" ;;
    httpd|apache2)
        echo "  Apache: The web server that built the open internet" ;;
    mysql|mariadb)
        echo "  MySQL/MariaDB: Open source at the heart of millions of apps" ;;
    libreoffice)
        echo "  LibreOffice: Born from a community fork — freedom in action" ;;
    *)
        echo "  $PACKAGE: Part of the open-source ecosystem powering the world" ;;
esac

echo ""
echo "========================================"
