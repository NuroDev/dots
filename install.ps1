# ========================================================================
# Elevated execution policy permissions
# ========================================================================
Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# ========================================================================
# Run Windows debloater
# ========================================================================
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://github.com/Sycnex/Windows10Debloater/blob/master/Windows10DebloaterGUI.ps1')

# ========================================================================
# Install Scoop
# ========================================================================
$env:SCOOP='G:\Apps\scoop' # Change to custom install path
[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

scoop install deno
scoop install ffmpeg
scoop install premake
scoop install winmtr
scoop install youtube-dl

# ========================================================================
# Install packages using `winget`
# ========================================================================

# ========================================================================
# Drive letters
# ========================================================================
$DEV_DRIVE="D:"
$GAMES_DRIVE="G:"
$MISC_DRIVE="M:"

# ========================================================================
# Apps
# ========================================================================
$MISC_APPS_PATH=$MISC_DRIVE + "\apps\"
winget install --id=AgileBits.1Password -e -l $MISC_APPS_PATH + "1Password"
winget install --id=7zip.7zip -e -l $MISC_APPS_PATH + "7zip"
winget install --id=Discord.Discord -e -l $MISC_APPS_PATH + "Discord"
winget install --id=Microsoft.Edge -e -l $MISC_APPS_PATH + "Edge"
winget install --id=Notion.Notion -e -l $MISC_APPS_PATH + "Notion"
winget install --id=RARLab.WinRAR -e -l $MISC_APPS_PATH + "WinRAR"
winget install --id=OBSProject.OBSStudio -e -l $MISC_APPS_PATH + "OBSStudio"
winget install --id=SparkLabs.Viscosity -e -l $MISC_APPS_PATH + "Viscosity"

# ========================================================================
# Dev
# ========================================================================
$DEV_TOOLS_PATH=$DEV_DRIVE + "\tools\"
winget install --id=Kitware.CMake -e -l $DEV_TOOLS_PATH + "cmake"
winget install --id=Git.Git -e -l $DEV_TOOLS_PATH + "git"
winget install --id=OpenJS.Nodejs -e -l $DEV_TOOLS_PATH + "nodejs"
winget install --id=Rust.rustup -e -l $DEV_TOOLS_PATH + "rustup"
winget install --id=Yarn.Yarn -e -l $DEV_TOOLS_PATH + "yarn"

$DEV_APPS_PATH=$DEV_DRIVE + "\apps\"
winget install --id=Axosoft.GitKraken -e -l $DEV_TOOLS_PATH + "GitKraken"
winget install --id=Microsoft.VisualStudioCode -e -l $DEV_TOOLS_PATH + "VisualStudioCode"
winget install --id=Microsoft.VisualStudio.Community -e -l $DEV_TOOLS_PATH + "VisualStudio"
winget install --id=Microsoft.WindowsTerminal -e -l $DEV_TOOLS_PATH + "WindowsTerminal"

# ========================================================================
# Game Launchers
# ========================================================================
$GAME_LAUNCHERS_INSTALL_PATH=$GAMES_DRIVE + "\launchers\"
winget install --id=Blizzard.BattleNet -e -l $GAME_LAUNCHERS_INSTALL_PATH + "BattleNet"
winget install --id=EpicGames.EpicGamesLauncher -e -l $GAME_LAUNCHERS_INSTALL_PATH + "EpicGamesLauncher"
winget install --id=GOG.Galaxy -e -l $GAME_LAUNCHERS_INSTALL_PATH + "Galaxy"
winget install --id=ElectronicArts.Origin -e -l $GAME_LAUNCHERS_INSTALL_PATH + "Origin"
winget install --id=Valve.Steam -e -l $GAME_LAUNCHERS_INSTALL_PATH + "Steam"
winget install --id=RiotGames.Valorant -e -l $GAME_LAUNCHERS_INSTALL_PATH + "Valorant"
