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


