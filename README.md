# Bash script for OSINTk.o tools 

OSINTkoSCR is a streamlined installation script designed for setting up a customized OSINT toolkit on Kali Linux. The script installs a curated selection of OSINT tools, ranging from username lookups to social media analysis, and creates menu entries for quick access. 

While OSINTkoSCR was initially designed for the OSINTko Kali ISO, it is flexible and can be modified to work on other Linux distributions. Some adjustments to paths or dependencies may be required based on the environment.


## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Tools](#tools)
- [Notes](#notes)

---

## Features
- **Automated Installation**: Automatically clones, installs, and configures various OSINT tools from GitHub repositories.
- **Virtual Environments**: Each tool is installed in its own isolated Python virtual environment to prevent dependency conflicts.
- **System Menu Integration**: Creates `.desktop` entries to allow launching tools directly from the system application menu.
- **Pipx Support**: Installs and configures pipx tools, providing system-wide executables for selected OSINT utilities.

## Installation
To set up OSINTkoSCR, follow these steps:

1. **Clone the Repository and run the script**:
   ```bash
   git clone https://github.com/LinaYorda/osintkoSCR.git
   cd osintkoSCR
   bash ./osintkoSCR.sh

## Tools
The following tools are included:

### Username


- [Aliens Eye](https://github.com/arxhr007/Aliens_eye)
- [Blackbird](https://github.com/p1ngul1n0/blackbird)
- [Nexfil](https://github.com/thewhiteh4t/nexfil)
- [Social-Analyzer](https://github.com/qeeqbox/social-analyzer)
- [Socialscan](https://github.com/iojw/socialscan)

### Phone number 

- [Findigo](https://github.com/De-Technocrats/findigo)
- [Inspector](https://github.com/N0rz3/Inspector)
- [Phunter](https://github.com/N0rz3/Phunter)
- [No-Infoga](https://github.com/akashblackhat/no-infoga.py)

### Email

- [Eyes](https://github.com/N0rz3/Eyes)
- [Holehe](https://github.com/megadose/holehe)
- [Zehef](https://github.com/N0rz3/Zehef)
- [GHunt](https://github.com/mxrch/GHunt)

### Social Media

- [GitSint](https://github.com/N0rz3/GitSint)
- [Instaloader](https://github.com/instaloader/instaloader)
- [Masto](https://github.com/C3n7ral051nt4g3ncy/Masto)
- [Osgint](https://github.com/hippiiee/osgint)
- [Toutatis](https://github.com/megadose/toutatis)

## Notes

- Desktop Directories: For the .desktop entries to work effectively, ensure you have a desktop-directories structure created. This is typically pre-configured in environments like XFCE but may require additional setup on others.

- Customization: OSINTkoSCR is a flexible, universal script that can be modified to add additional tools by including them in the script’s tool arrays. Users are encouraged to add their own OSINT tools and categories as desired.




