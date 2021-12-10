#!/bin/bash

if test ! $([ -d "~/.ssh/" ]); then
echo "
╔══════════════════════════════════════════════╗
║   SSH key already generated ✨               ║
╚══════════════════════════════════════════════╝
"
else
echo "
╔══════════════════════════════════════════════╗
║   Generating SSH Key ✨                      ║
╚══════════════════════════════════════════════╝
"
mkdir -p ~/.ssh/
chmod 700 ~/.ssh/
ssh-keygen
fi

echo "
╔══════════════════════════════════════════════╗
║   Configuring ZSH ⚡️                         ║
╚══════════════════════════════════════════════╝
"
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if test ! $(which zsh); then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
  chsh -s /usr/local/bin/zsh
fi

echo "
╔══════════════════════════════════════════════╗
║   Linking 🔗                                 ║
╚══════════════════════════════════════════════╝
"

rm ~/.zshrc

sudo ln -s ~/dots/.aliases  ~/.aliases
sudo ln -s ~/dots/.fet  ~/.fet
sudo ln -s ~/dots/.functions  ~/.functions
sudo ln -s ~/dots/.nanorc  ~/.nanorc
sudo ln -s ~/dots/.zshrc  ~/.zshrc
sudo ln -s ~/dots/.sampler.yml  ~/.config/sampler.yml
sudo ln -s ~/dots/.gitconfig  ~/.gitconfig

echo "
╔══════════════════════════════════════════════╗
║   Configuring Raycast 🔧                     ║
╚══════════════════════════════════════════════╝
"
git clone https://github.com/raycast/script-commands ~/.config/raycast-scripts

echo "
╔══════════════════════════════════════════════╗
║   Configuring Editor 🔧                      ║
╚══════════════════════════════════════════════╝
"
wget https://raw.githubusercontent.com/nurodev/dots/macos/.vscode/settings.json -O $HOME/Library/Application Support/Code/User/settings.json

echo "
╔══════════════════════════════════════════════╗
║   Configuring macOS 🍎                       ║
╚══════════════════════════════════════════════╝
"

# Hide the "Last login' terminal prompt prefix
touch ~/.hushlogin

# Allow quitting via ⌘ + Q of Finder
defaults write com.apple.finder QuitMenuItem -bool true

# Show all hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Hide Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Disable AutoFill
# defaults write com.apple.Safari AutoFillFromAddressBook -bool false
# defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Disable plug-ins
defaults write com.apple.Safari WebKitPluginsEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false

# Disable Java
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Set system theme to dark theme
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to not dark mode'
