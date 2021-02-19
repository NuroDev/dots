#!/bin/bash

export mas_apps=(
  1333542190 # 1Password
  1351639930 # Gifski
  1176895641 # Spark
  1153157709 # Speedtest
  1451685025 # Wireguard
  497799835 # Xcode
)

echo "
╔══════════════════════════════════════════════╗
║   Installing MAS Apps 🍎                     ║
╚══════════════════════════════════════════════╝
"
install 'mas install' ${mas_apps[@]}
