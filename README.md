# VirustotalT
A lightweight bash-based tool inspired by [GodFatherOrwa's VirusTotalX]. Give it a domain as input and it outputs:  - Subdomains -(Unique Subdomains), URLs/Endpoints (Potentially with Sensitive Info), IPs (Helful in finding Origin IPs).

# Features
- Enumerate **all subdomains**, **URLs**, and **IP addresses** for a given domain.
- Extract **unique subdomains**.
- Identify URLs that might expose **sensitive information**.
- Use discovered IPs to trace **origin servers**.


# 🛠 Dependencies
gron – For JSON parsing via the CLI:
- `go install github.com/tomnomnom/gron@latest`

Add the following aliases in your `~/.bashrc` or `~/.zshrc file`:
- `alias norg="gron --ungron"`
- `alias ungron="gron --ungron"`

Then reload the shell config:
- `source ~/.bashrc`  # or `~/.zshrc`

# Usage
- `./virustotalT.sh domain.com`
Replace domain.com with the target domain.

Make sure you’ve added your VirusTotal API key as an environment variable or directly in the script.

# Disclaimer
This tool is intended for educational and authorized security research purposes only. Do not use it on systems you do not own or have explicit permission to test.
