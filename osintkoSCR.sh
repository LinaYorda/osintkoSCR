#!/bin/bash 

BASE_DIR="$HOME/OSINTko"
DESKTOP_DIR="$HOME/.local/share/applications"
BIN_DIR="$HOME/.local/bin"

sudo apt update
sudo apt install -y python3-pip python3-venv pipx

mkdir -p "$BASE_DIR" "$DESKTOP_DIR" "$BIN_DIR"

if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    export PATH="$BIN_DIR:$PATH"
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

cd "$BASE_DIR"

declare -A urls=(
    ["Blackbird"]="https://github.com/p1ngul1n0/blackbird.git"
    ["AliensEye"]="https://github.com/arxhr007/Aliens_eye.git"
    ["UserFinder"]="https://github.com/mishakorzik/UserFinder.git"
    ["Findigo"]="https://github.com/De-Technocrats/findigo.git"
    ["Inspector"]="https://github.com/N0rz3/Inspector.git"
    ["NoInfoga"]="https://github.com/akashblackhat/no-infoga.py.git"
    ["Phunter"]="https://github.com/N0rz3/Phunter.git"
    ["Eyes"]="https://github.com/N0rz3/Eyes.git"
    ["Profil3r"]="https://github.com/Greyjedix/Profil3r.git"
    ["Zehef"]="https://github.com/N0rz3/Zehef.git"
    ["GitSint"]="https://github.com/N0rz3/GitSint.git"
    ["Masto"]="https://github.com/C3n7ral051nt4g3ncy/Masto.git"
    ["Osgint"]="https://github.com/hippiiee/osgint.git"
)

declare -A scripts=(
    ["Blackbird"]="blackbird.py"
    ["AliensEye"]="aliens_eye.py"
    ["Findigo"]="main.py"
    ["Inspector"]="core/inspector.py"
    ["NoInfoga"]="no-infoga.py"
    ["Phunter"]="phunter.py"
    ["Eyes"]="eyes.py"
    ["Profil3r"]="profil3r.py"
    ["Zehef"]="zehef.py"
    ["GitSint"]="gitsint.py"
    ["Masto"]="masto.py"
    ["Osgint"]="osgint.py"
)

declare -A categories=(
    ["Blackbird"]="osint-username;"
    ["AliensEye"]="osint-username;"
    ["UserFinder"]="osint-username;"
    ["Findigo"]="osint-phone-number;"
    ["Inspector"]="osint-phone-number;"
    ["NoInfoga"]="osint-phone-number;"
    ["Phunter"]="osint-phone-number;"
    ["Eyes"]="osint-email;"
    ["Profil3r"]="osint-email;"
    ["Zehef"]="osint-email;"
    ["GitSint"]="osint-social-media;"
    ["Masto"]="osint-social-media;"
    ["Osgint"]="osint-social-media;"
)

for tool in "${!urls[@]}"; do 
    tool_dir="$BASE_DIR/$tool"

    if [ ! -d "$tool_dir" ]; then 
        echo "Installing $tool..."
        git clone "${urls[$tool]}" "$tool_dir"
        cd "$tool_dir" || exit 1
        python3 -m venv "$tool_dir/venv"
        source "$tool_dir/venv/bin/activate"

        if [ -f "$tool_dir/requirements.txt" ]; then
            pip install -r requirements.txt
        elif [ -f "$tool_dir/setup.py" ]; then
            python3 setup.py install
        fi
        deactivate

	cat << EOF > "$BIN_DIR/$tool"
#!/bin/bash
cd "$tool_dir" || exit 1
source "$tool_dir/venv/bin/activate"
python3 "${scripts[$tool]}" "\$@"
deactivate
EOF
        chmod +x "$BIN_DIR/$tool"

        
	cat << EOF > "$DESKTOP_DIR/${tool}.desktop"
[Desktop Entry]
Name=$tool
Comment=$tool is an OSINT tool.
Exec=xfce4-terminal -H -e "$BIN_DIR/$tool"
Icon=utilities-terminal
Terminal=true
Type=Application
Categories=${categories[$tool]}
EOF
    else 
        echo "$tool is already installed."
    fi
done

declare -A pipx_tools=(
    ["socialscan"]="osint-username;"
    ["social-analyzer"]="osint-username;"
    ["nexfil"]="osint-username;"
    ["instaloader"]="osint-social-media;"
    ["holehe"]="osint-email;"
    ["ghunt"]="osint-email;"
    ["osint"]="recon;"
    ["toutatis"]="osint-social-media;"
)

for pipx_tool in "${!pipx_tools[@]}"; do
    if ! pipx list | grep -q "$pipx_tool"; then
        pipx install "$pipx_tool"
    fi
    cat << EOF > "$DESKTOP_DIR/${pipx_tool}.desktop"
[Desktop Entry]
Name=${pipx_tool^}
Comment=${pipx_tool^} is an OSINT tool
Exec=xfce4-terminal -H -e "$HOME/.local/bin/$pipx_tool"
Icon=utilities-terminal
Terminal=true
Type=Application
Categories=${pipx_tools[$pipx_tool]}
EOF
done

echo "Installation completed. If the new tools do not appear in your menu, please refresh your application menu or restart your system."

echo "Note: For KDE, GNOME, or Xfce users, log out and log back in or use a menu refresh tool for changes to appear."

