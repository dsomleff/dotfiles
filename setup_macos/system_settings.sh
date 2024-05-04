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
defaults write com.apple.dock tilesize -int 60
defaults write com.apple.dock largesize -float 128
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
