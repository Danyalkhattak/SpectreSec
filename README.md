
# SpectreSec - Advanced Cybersecurity Toolkit

SpectreSec is a powerful, multi-functional cybersecurity toolkit designed to make network analysis, OSINT, vulnerability scanning, and forensic analysis straightforward and effective. It’s compatible with **Kali Linux**, **Termux**, and **PowerShell** environments, providing a wide array of security assessment tools and a convenient, user-friendly interface.

## Features

SpectreSec includes advanced tools for ethical hacking and network analysis, combining the best open-source tools into a single, easy-to-use script:

1. **Port Scanning** - Flexible intensity settings for port scanning.
2. **Vulnerability Scanning** - Web vulnerability scanning with `Nikto`.
3. **Brute-force SSH Login** - Attempt SSH brute-forcing for ethical penetration testing.
4. **Weak Password Check** - Check for weak passwords using `John the Ripper`.
5. **OSINT (Whois Lookup)** - Perform Whois lookups to gather domain information.
6. **Network Monitoring** - Monitor real-time network traffic with `tcpdump`.
7. **File Hash Analysis** - Perform MD5 hash checks for file integrity analysis.
8. **HTTP Header Information** - Retrieve HTTP headers from a target URL.
9. **Network Analysis** - Identify active devices and open ports in a specified network range.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Screenshots](#screenshots)
- [Disclaimer](#disclaimer)
- [License](#license)

## Installation

SpectreSec can be installed and run on **Kali Linux**, **Termux** (Android), and **PowerShell** environments.

### Prerequisites

Ensure the following packages are installed:

- `nmap`
- `nikto`
- `hydra`
- `john`
- `jq`
- `netcat`
- `curl`
- `whois`
- `tcpdump`

SpectreSec will automatically attempt to install any missing dependencies on the first run.

### Installation Instructions

#### For Linux (Kali)

1. **Clone the Repository:**

   Open a terminal and clone the SpectreSec repository:

   ```bash
   git clone https://github.com/Danyalkhattak/SpectreSec.git
   cd SpectreSec
   ```

2. **Make the Script Executable:**

   Make the script executable by running:

   ```bash
   chmod +x spectresec.sh
   ```

3. **Run the Script:**

   Start SpectreSec by executing:

   ```bash
   sudo ./spectresec.sh
   ```

   > **Note**: SpectreSec requires root privileges for some tools like `nmap`, `tcpdump`, and `john`. Use `sudo` to run it with the necessary permissions.

#### For Termux (Android)

1. **Clone the Repository:**

   Open Termux and enter the following commands to clone the repository:

   ```bash
   pkg update && pkg upgrade -y
   pkg install git -y
   git clone https://github.com/yourusername/SpectreSec.git
   cd SpectreSec
   ```

2. **Make the Script Executable:**

   Make the script executable:

   ```bash
   chmod +x spectresec.sh
   ```

3. **Install Dependencies:**

   Some tools may need to be installed manually in Termux. Run:

   ```bash
   pkg install nmap curl netcat jq whois -y
   ```

   > **Note**: Some tools like `tcpdump`, `nikto`, and `john` may not be directly available on Termux. You can skip those functions if any tools are unavailable.

4. **Run the Script:**

   Start SpectreSec in Termux by executing:

   ```bash
   ./spectresec.sh
   ```

## Usage

Launch SpectreSec to access a menu of options for various cybersecurity tools. Each option is designed to perform a specific security or forensic function:

```plaintext
=== SpectreSec: Advanced Cybersecurity Toolkit ===
1. Port Scan
2. Vulnerability Scan (Nikto)
3. Brute-force SSH Login
4. Weak Password Check (John the Ripper)
5. OSINT Whois Lookup
6. Network Monitoring (tcpdump)
7. File Hash Analysis
8. HTTP Header Information
9. Network Analysis
10. Exit
```

Select an option by typing the number corresponding to the tool or action you want to perform. Follow the on-screen prompts for input details (IP addresses, domains, file paths, etc.).

### Example Commands

- **Port Scan**: Enter the target IP and choose the scan intensity level (1-5).
- **Vulnerability Scan**: Enter the IP or domain for Nikto to scan.
- **Brute-force SSH Login**: Requires a target IP and username; uses the rockyou.txt wordlist.


## Disclaimer

**SpectreSec is intended for ethical use only.** Always ensure you have permission to scan and test any system. Unauthorized use of these tools on systems without permission is illegal and can lead to serious consequences. The developers of SpectreSec assume no liability for misuse or illegal activities.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
