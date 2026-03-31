#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Anvi Vajpayee | Reg: 24BCE11447
# Description: Interactively generates a personalised open-source
#              philosophy statement and saves it to a .txt file.
#
# Note on aliases: An alias is a shorthand for a longer command.
# Example (not run here, but demonstrating the concept):
#   alias generate_manifesto="bash ~/manifesto.sh"
# This would let you type 'generate_manifesto' instead of the full path.

echo "============================================================"
echo "   Open Source Manifesto Generator"
echo "   Course: Open Source Software | Anvi Vajpayee"
echo "============================================================"
echo ""
echo "Answer three questions to generate your personal manifesto."
echo ""

# --- Interactive input using 'read' ---
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you?  " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# Validate that all inputs were provided
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo ""
    echo "Error: All three answers are required. Please re-run the script."
    exit 1
fi

# --- Date and output file setup ---
DATE=$(date '+%d %B %Y')
CURRENT_USER=$(whoami)
OUTPUT="manifesto_${CURRENT_USER}.txt"   # Dynamic filename using string concatenation

# --- Compose the manifesto using string concatenation and echo ---
{
    echo "============================================================"
    echo "   MY OPEN SOURCE MANIFESTO"
    echo "   Written by: $CURRENT_USER | Date: $DATE"
    echo "============================================================"
    echo ""
    echo "Every day, I rely on $TOOL — a piece of software that exists"
    echo "because someone chose to share their work with the world."
    echo "That choice reflects what I believe open source really means:"
    echo "$FREEDOM."
    echo ""
    echo "Open source is not just a licensing model. It is a statement"
    echo "about how knowledge should move through the world — openly,"
    echo "freely, and without gatekeepers. The software I depend on was"
    echo "built by people I will never meet, who trusted that their work"
    echo "would be used and improved by strangers."
    echo ""
    echo "I carry that trust forward. If I had the skills and the time,"
    echo "I would build $BUILD and release it freely under an open"
    echo "licence — because the things we make together are always"
    echo "greater than the things we keep for ourselves."
    echo ""
    echo "I stand on the shoulders of everyone who wrote a line of"
    echo "open-source code before me. This is my commitment to pass"
    echo "that forward."
    echo ""
    echo "Signed: $CURRENT_USER"
    echo "Date  : $DATE"
    echo "============================================================"
} > "$OUTPUT"    # Write entire block to file using output redirection

echo ""
echo "  Manifesto saved to: $OUTPUT"
echo ""

# Display the generated manifesto
cat "$OUTPUT"
