#!/bin/bash
# Script 4: Log File Analyzer
# Author: Anvi Vajpayee | Reg: 24BCE11447
# Usage: ./log_analyzer.sh <logfile> [keyword]
# Description: Reads a log file line by line, counts keyword
#              occurrences, and prints a summary with examples.

# --- Command-line arguments ---
LOGFILE=$1                    # First argument: path to log file
KEYWORD=${2:-"error"}         # Second argument: keyword (default: 'error')
COUNT=0                       # Counter variable initialised to zero

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog warning"
    exit 1
fi

# --- Check that the file actually exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' not found."
    exit 1
fi

# --- Check if file is empty; retry logic ---
RETRY=0
while [ ! -s "$LOGFILE" ] && [ $RETRY -lt 3 ]; do
    echo "Warning: '$LOGFILE' appears to be empty. Waiting 2s... (attempt $((RETRY+1))/3)"
    sleep 2
    RETRY=$((RETRY + 1))
done

if [ ! -s "$LOGFILE" ]; then
    echo "File is empty after retries. Exiting."
    exit 1
fi

echo "============================================================"
echo "  Log File Analyzer"
echo "  File    : $LOGFILE"
echo "  Keyword : '$KEYWORD'"
echo "============================================================"
echo ""

# --- while-read loop: read file line by line ---
while IFS= read -r LINE; do

    # if-then: check if current line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment counter
    fi

done < "$LOGFILE"             # Redirect file content into while loop

# --- Summary ---
echo "  Total lines scanned : $(wc -l < "$LOGFILE")"
echo "  Keyword matches     : $COUNT"
echo ""

# --- Show last 5 matching lines using grep + tail ---
if [ $COUNT -gt 0 ]; then
    echo "  Last 5 matching lines:"
    echo "  ----------------------"
    grep -i "$KEYWORD" "$LOGFILE" | tail -5 | while IFS= read -r MATCH; do
        echo "  > $MATCH"
    done
else
    echo "  No matches found for '$KEYWORD'."
fi

echo ""
echo "============================================================"
