#!/usr/bin/env bash

################################################################################
# System Preferences > General > Language & Region
################################################################################
defaults write ".GlobalPreferences_m" AppleLanguages -array en-SK sk-SK uk-SK
defaults write -globalDomain AppleLanguages -array en-SK sk-SK uk-SK

################################################################################
# System Preferences > Appearance
################################################################################

# Appearance: Auto
defaults write -globalDomain AppleInterfaceStyleSwitchesAutomatically -bool true
defaults write -globalDomain AppleLocale -string en_SK
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true
defaults write -globalDomain AppleMenuBarVisibleInFullscreen -bool false

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

################################################################################
# System Preferences > Control Centre
################################################################################

# Wi-Fi: Show in Menu Bar
defaults write com.apple.controlcenter "NSStatusItem Visible WiFi" -bool true

# Bluetooth: Don’t Show in Menu Bar
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool false

# AirDrop: Don’t Show in Menu Bar
defaults write com.apple.controlcenter "NSStatusItem Visible AirDrop" -bool false

# Focus: Show When Active
defaults write com.apple.controlcenter "NSStatusItem Visible Focus" -bool true

# Accessibility Shortcuts: Show in Menu Bar: off, Show in Control Centre: off
defaults write com.apple.controlcenter "NSStatusItem Visible Accessibility Shortcuts" -bool false

# Battery: Show in Menu Bar: on, Show in Control Centre: off, Show Percentage: on
defaults write com.apple.controlcenter "NSStatusItem Visible Battery" -bool true
defaults write com.apple.controlcenter "NSStatusItem Visible BatteryShowPercentage" -bool true

# Automatically hide/show menu bar (from the top of the screen)
defaults write NSGlobalDomain _HIHideMenuBar -bool true

################################################################################
# System Preferences > Desktop & Dock Settings
################################################################################

# Dock
defaults write com.apple.dock tilesize -int 75
defaults write com.apple.dock largesize -float 90
defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock show-recents -bool false

# Desktop & Stage Manager
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Windows
defaults write -g NSCloseAlwaysConfirmsChanges -bool true

# Mission Control
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock expose-group-by-app -bool false
defaults write com.apple.dock minimize-to-application -bool true

# Set the default web browser for HTTP/HTTPS
defaults write ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist LSHandlers -array-add '{ \
    LSHandlerContentType = "public.html"; \
    LSHandlerRoleAll = "company.thebrowser.browser"; \
}'

################################################################################
# System Preferences > Keyboard & Trackpad
################################################################################

# Keep repeat rate: Fast
defaults write -g KeyRepeat -int 2

# Delay until repeat: short
defaults write -g InitialKeyRepeat -int 15

# Turn keyboard backlight off after inactivity: After 1 Minute
defaults write com.apple.BezelServices kDimTime -int 60

# Keyboard navigation: on
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# Add ABC keyboard layout
defaults write ~/Library/Preferences/com.apple.HIToolbox.plist AppleEnabledInputSources -array-add '{
    InputSourceKind = "Keyboard Layout";
    "KeyboardLayout ID" = 0;
    "KeyboardLayout Name" = "ABC";
}'

# Add Ukrainian keyboard layout
defaults write ~/Library/Preferences/com.apple.HIToolbox.plist AppleEnabledInputSources -array-add '{
    InputSourceKind = "Keyboard Layout";
    "KeyboardLayout ID" = -2354;
    "KeyboardLayout Name" = "Ukrainian-PC";
}'

# Trackpad Tracking speed
defaults write ~/Library/Preferences/.GlobalPreferences.plist com.apple.trackpad.scaling -float 2

################################################################################
# System Preferences > Screen
################################################################################

# Start Screen Saver when inactive for 10 min
defaults -currentHost write com.apple.screensaver idleTime -int 600

# Turn display off on battery when inactive for 10 min
sudo pmset -b displaysleep 10

# Turn display off on power adapter when inactive for 10 min
sudo pmset -c sleep 10

# Require password after screen saver begins or display is turned off immediately
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show large clock on lock screen
defaults write com.apple.screensaver showClock -bool true

# Show username and photo on lock screen
defaults write com.apple.loginwindow AdminHostInfo HostName

# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done

# Done
echo "Done. Note that some of these changes require a logout/restart to take effect."
