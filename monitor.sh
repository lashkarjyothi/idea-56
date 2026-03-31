#!/bin/bash

# monitor.sh - Simple system monitoring script

INTERVAL=5   # seconds between checks

echo "Starting system monitor (updates every $INTERVAL seconds)..."
echo "Press Ctrl+C to stop."
echo ""

while true
do
    clear
    echo "===== SYSTEM MONITOR ====="
    echo "Time: $(date)"
    echo ""

    echo "---- CPU Load ----"
    uptime
    echo ""

    echo "---- Memory Usage ----"
    free -h
    echo ""

    echo "---- Disk Usage ----"
    df -h
    echo ""

    echo "---- Top Processes ----"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10
    echo ""

    sleep $INTERVAL
done
