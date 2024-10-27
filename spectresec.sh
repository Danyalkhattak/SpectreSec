#!/bin/bash

# SpectreSec: Advanced Cybersecurity Toolkit

# Function to check and install dependencies
install_dependencies() {
    echo "Checking dependencies..."
    dependencies=("nmap" "nikto" "hydra" "john" "jq" "netcat" "curl" "whois" "tcpdump")

    for dep in "${dependencies[@]}"; do
        if ! command -v $dep &>/dev/null; then
            echo "$dep is not installed. Installing..."
            if [[ "$OSTYPE" == "linux-gnu"* ]]; then
                sudo apt update && sudo apt install -y $dep
            elif [[ "$OSTYPE" == "android"* ]]; then
                pkg install $dep -y
            fi
        fi
    done
    echo "All dependencies are installed."
}

# Port Scan with additional intensity options
port_scan() {
    echo -n "Enter target IP: "
    read target
    echo -n "Select intensity (1-5): "
    read intensity
    echo "Scanning open ports on $target with intensity $intensity..."
    sudo nmap -sS -Pn -T$intensity $target
}

# Vulnerability Scan with Nikto
vulnerability_scan() {
    echo -n "Enter target IP or domain: "
    read target
    echo "Scanning for vulnerabilities on $target..."
    nikto -h $target
}

# SSH brute-force attack (for ethical testing)
brute_force_ssh() {
    echo -n "Enter target IP: "
    read target
    echo -n "Enter username: "
    read username
    echo "Attempting brute-force on SSH..."
    hydra -l $username -P /usr/share/wordlists/rockyou.txt ssh://$target
}

# Weak Password Check using John the Ripper
weak_password_check() {
    echo "Checking for weak passwords..."
    sudo unshadow /etc/passwd /etc/shadow | john --wordlist=/usr/share/wordlists/rockyou.txt --
}

# OSINT Function: Perform Whois Lookup
osint_whois() {
    echo -n "Enter target domain: "
    read domain
    echo "Gathering Whois information for $domain..."
    whois $domain
}

# Network Monitoring with tcpdump
network_monitor() {
    echo "Starting network monitor (tcpdump)... Press Ctrl+C to stop."
    sudo tcpdump -i any -n
}

# File Hash Analysis (md5sum for basic integrity check)
file_hash_analysis() {
    echo -n "Enter the file path: "
    read filepath
    echo "Calculating MD5 hash for $filepath..."
    md5sum $filepath
}

# HTTP Header Information with cURL
http_header_info() {
    echo -n "Enter target URL (e.g., http://example.com): "
    read url
    echo "Fetching HTTP headers for $url..."
    curl -I $url
}

# Function to analyze a network for active devices and open ports
network_analysis() {
    echo -n "Enter network range (e.g., 192.168.1.0/24): "
    read range
    echo "Analyzing network $range..."
    sudo nmap -sP $range | grep "Nmap scan report" | awk '{print $5}'
    sudo nmap -sS $range | grep "open"
}

# Main menu
main_menu() {
    echo "=== SpectreSec: Advanced Cybersecurity Toolkit ==="
    while true; do
        echo "1. Port Scan"
        echo "2. Vulnerability Scan (Nikto)"
        echo "3. Brute-force SSH Login"
        echo "4. Weak Password Check (John the Ripper)"
        echo "5. OSINT Whois Lookup"
        echo "6. Network Monitoring (tcpdump)"
        echo "7. File Hash Analysis"
        echo "8. HTTP Header Information"
        echo "9. Network Analysis"
        echo "10. Exit"
        echo "Choose an option (1-10): "
        read -r option

        case $option in
            1) port_scan ;;
            2) vulnerability_scan ;;
            3) brute_force_ssh ;;
            4) weak_password_check ;;
            5) osint_whois ;;
            6) network_monitor ;;
            7) file_hash_analysis ;;
            8) http_header_info ;;
            9) network_analysis ;;
            10) echo "Exiting..."; exit 0 ;;
            *) echo "Invalid option. Please try again." ;;
        esac
    done
}

# Environment check for installation
echo "Initializing SpectreSec Toolkit..."
install_dependencies
main_menu
