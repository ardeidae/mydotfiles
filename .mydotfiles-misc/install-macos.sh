#!/bin/bash

# ask for the administrator password upfront
sudo -v

# keep-alive: update existing `sudo` time stamp until this script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

./Brewfile
./Caskfile

dockutil --no-restart --remove all

dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add "/System/Applications/App Store.app"
dockutil --no-restart --add "/System/Applications/Calendar.app"
dockutil --no-restart --add "/System/Applications/Contacts.app"
dockutil --no-restart --add "/System/Applications/Mail.app"
dockutil --no-restart --add "/System/Applications/Music.app"

dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/MacVim.app"
dockutil --no-restart --add "/Applications/Sourcetree.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Xcode.app"
dockutil --no-restart --add "/Applications/Insomnia.app"
dockutil --no-restart --add "/Applications/Postman.app"
dockutil --no-restart --add "/Applications/VirtualBox.app"
dockutil --no-restart --add "/Applications/Docker.app"
dockutil --no-restart --add "/Applications/Kitematic.app"

dockutil --no-restart --add "/Applications/Bitwarden.app"
dockutil --no-restart --add "/Applications/Brave Browser.app"
dockutil --no-restart --add "/Applications/Firefox.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/qutebrowser.app"
dockutil --no-restart --add "/Applications/TeamViewer.app"
dockutil --no-restart --add "/Applications/Dropbox.app"
dockutil --no-restart --add "/Applications/Microsoft Excel.app"
dockutil --no-restart --add "/Applications/Microsoft PowerPoint.app"
dockutil --no-restart --add "/Applications/Microsoft Word.app"
dockutil --no-restart --add "/Applications/Team.app"
dockutil --no-restart --add "/Applications/Signal.app"
dockutil --no-restart --add "/Applications/Transmission.app"
dockutil --no-restart --add "/Applications/VLC.app"


####################
# general settings #
####################

# restart your mac automatically after it freezes
sudo systemsetup -setrestartfreeze on

# enable ssh
sudo systemsetup -setremotelogin on

# check for software updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# disable screenshot shadows
defaults write com.apple.screencapture disable-shadow -bool true

# screenshots are saved into ~/Pictures/Screenshots in png format
mkdir ~/Pictures/Screenshots
defaults write com.apple.screencapture location -string ~/Pictures/Screenshots
defaults write com.apple.screencapture type -string png

# add extra information to login window when clicking on the time
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# set a fast key repeat delay
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# set a fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#################
# dock settings #
#################

# automatically hide and show the dock
defaults write com.apple.dock autohide -bool true

# remove the auto-hiding dock delay
defaults write com.apple.dock autohide-delay -float 0

# remove the animation when hiding/showing the dock
defaults write com.apple.dock autohide-time-modifier -float 0.25

# enable dock spring opening and stacks item finder
defaults write com.apple.dock enable-spring-load-actions-on-all-items -boolean yes

# decrease the spring loading delay
defaults write NSGlobalDomain com.apple.springing.delay -float 0.2

# do not animate opening applications from the dock
defaults write com.apple.dock launchanim -bool false

# minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# enable highlight hover effect for the grid view of a stack (dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

###################
# finder settings #
###################

# allow finder to quit
defaults write com.apple.finder QuitMenuItem -bool true

# disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# disable cmd + i animation
defaults write com.apple.finder DisableAllAnimations -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# show side bar
defaults write com.apple.finder ShowSidebar -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# hide icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# when performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# use list view in all finder windows by default
# four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


# restart affected services
killall Dock
killall Finder
killall SystemUIServer
