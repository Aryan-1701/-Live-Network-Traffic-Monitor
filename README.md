# Live-Network-Traffic-Monitor
This project involves building a Bash-based tool to monitor live network traffic on a Linux system in real time. It leverages command-line utilities like tcpdump, netstat, iftop, and ip to capture, analyze, and display essential network data

Here's a more detailed explanation of each command used in the Bash script, following the same sequence, with definitions, syntax, and one relevant example for each:

1. echo
Definition:
echo is used to display text or variables on the terminal. It's commonly used to give prompts, status messages, or outputs within shell scripts.
When used with the -e option, it interprets escape sequences like \n (new line), \t (tab), and \c (no newline at end).

Syntax:
echo [options] [string]

Example:
echo -e "Enter your interface: \c"

This displays the prompt on the same line, waiting for user input (\c suppresses the newline).

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2. read
Definition:
read is used to accept input from the user and store it into one or more variables. It reads a line from standard input and splits it into fields.

Syntax:
read variable_name

Example:
read in

This stores the user’s input into the variable in.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

3. date
Definition:
date displays the system date and time. You can format the output using +FORMAT, such as year (%Y), month (%m), day (%d), hour (%H), etc.

Syntax:
date "+FORMAT"

Example:
timestamp=$(date "+%Y-%m-%d_%H-%M-%S")

This saves the current timestamp in the format YYYY-MM-DD_HH-MM-SS to the variable timestamp.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

4. ls
Definition:
ls lists the contents of a directory. The -a option includes hidden files (those starting with .).

Syntax:
ls [options] [directory]

Example:
ls -a

This lists all files including hidden ones in the current directory.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

5. grep
Definition:
grep is a command-line utility for searching plain-text data for lines that match a regular expression. It filters input line by line.

Syntax:
grep [options] pattern [file]

Example:
ls -a | grep Logs

This checks if Logs exists in the output of ls -a.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

6. if [ condition ] ... else ... fi
Definition:
Used to perform conditional execution. if evaluates a condition inside square brackets, and executes the corresponding block if true; otherwise, it executes the else block.

Syntax:
if [ condition ]; then
    command(s)
else
    command(s)
fi

Example:
if [ "$c1" == "Logs" ]; then
    echo "Logs directory already exists."
else
    mkdir -p Logs
fi

This checks if the variable c1 equals "Logs", and creates it if not.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

7. mkdir
Definition:
mkdir is used to create directories. The -p option ensures that no error is shown if the directory already exists, and creates parent directories as needed.

Syntax:
mkdir [options] directory_name

Example:
mkdir -p Logs

Creates the Logs directory if it doesn’t exist.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

8. tcpdump --version
Definition:
Displays the installed version of tcpdump, which is a command-line packet analyzer used for network traffic monitoring and troubleshooting.

Syntax:
tcpdump --version

Example:
tcpdump --version | grep tcpdump | awk '{print $1}'

Extracts just the word tcpdump from the version output to check if it’s installed.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

9. awk
Definition:
awk is a powerful text-processing command that allows manipulation and extraction of data from text files or command outputs.

Syntax:
awk '{action}' filename

Example:
awk '{print $1}'

Prints the first field (word) from each line of input.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

10. sudo apt install
Definition:
Installs software packages on Debian-based systems (like Kali Linux). sudo runs the command with superuser privileges, while apt is the package manager.

Syntax:
sudo apt install package_name

Example:
sudo apt install tcpdump

Installs the tcpdump tool if it’s not already installed.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

11. tcpdump
Definition:
A powerful command-line packet analyzer used to capture and display network packets. Great for network diagnostics and monitoring.

Syntax:
sudo tcpdump [options]

Example:
sudo tcpdump -i "$in" -w "$CAPTURE_FILE" -G "$du" -W 1 -n

    -i: Specifies the interface.

    -w: Write the captured packets to a file.

    -G: Rotate dump files every specified seconds.

    -W 1: Limit to 1 capture file.

    -n: Don’t resolve hostnames.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

12. tcpdump -r
Definition:
Reads packets from a capture file and prints them in a human-readable format.

Syntax:
tcpdump -r file

Example:
sudo tcpdump -r "$CAPTURE_FILE" -n -tttt | head -n 10

Reads and displays the first 10 lines of the captured packets.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

13. head
Definition:
Displays the first few lines of a file or output.

Syntax:
head -n number file

Example:
head -n 10

Shows the first 10 lines of input.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

14. >>
Definition:
Appends output to a file without overwriting the existing content.

Syntax:
echo "text" >> filename

Example:
echo "[+] Session Timestamp: $timestamp" >> "$LOG_FILE"

Appends the log entry to the traffic_log.txt file.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
