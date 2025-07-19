#! /bin/bash

echo -e "Enter your interface: \c"
read in
echo -e "Enter the duration: \c"
read du
timestamp=$(date "+%Y-%m-%d_%H-%M-%S")
CAPTURE_FILE="Capture/capture_$timestamp.pcap"
LOG_FILE="Logs/traffic_log.txt"
REPORT_FILE="Reports/report_$timestamp.txt"

c1=$(ls -a | grep Logs)
if [ "$c1" == "Logs" ]; then
	echo "$c1 directory already exists."
else
	mkdir -p Logs
fi

c2=$(ls -a | grep Capture)
if [ "$c2" == "Capture" ]; then
	echo "$c2 directory already exists."
else
	mkdir -p Capture
fi

c3=$(ls -a | grep Reports)
if [ "$c3" == "Reports" ]; then
	echo "$c3 directory already exists."
else
	mkdir -p Reports
fi

echo "[+] Starting network traffic capture on interface: $in"
echo "[+] Logging for $du seconds..."

tcpd=$(tcpdump --version | grep tcpdump | awk '{print $1}')
if [ "$tcpd" == "tcpdump" ]; then
	echo "=================================================================================="
	echo "Tcpdump is already present in your device, now starting to capture network traffic."
	echo "=================================================================================="
else
	echo "=========================================================================="
	echo "Tcpdump is not installed on your device, now starting to download tcpdump."
	echo "=========================================================================="
	sudo apt install tcpdump
	echo "================================================="
	echo "Tcpdump is successfully installed on your device."
	echo "================================================="
fi

sudo tcpdump -i "$in" -w "$CAPTURE_FILE" -G "$du" -W 1 -n

echo "====================================================="
sudo tcpdump -r "$CAPTURE_FILE" -n -tttt | head -n 10
echo "======================================"
echo "Successfully captured network traffic."
echo "======================================"

echo "[+] Session Timestamp: $timestamp" >> "$LOG_FILE"
echo "Captured file: $CAPTURE_FILE" >> "$LOG_FILE"
echo "Report file: $REPORT_FILE" >> "$LOG_FILE"
echo "Duration: $du seconds on $in" >> "$LOG_FILE"
echo "---------------------------------------------------" >> "$LOG_FILE"

echo "[+] Capture saved to: $CAPTURE_FILE"
echo "[+] Traffic report saved to: $REPORT_FILE"
echo "[+] Log updated: $LOG_FILE"
