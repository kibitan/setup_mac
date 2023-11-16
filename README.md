#### related document
  - (japanese) [Mac 環境構築の自動化 2015年末版 ( homebrew + homebrew-cask + homebrew-brewdle + mackup + crontab + mas-cli ) - Qiita](http://qiita.com/kibitan/items/d564248eeaebbf003edc)

# setup

## run [setup.sh](./setup.sh)
```bash
$ git clone https://github.com/kibitan/setup_mac.git ~/setup_mac
$ cd ~/setup_mac
$ git remote set-url origin git@github.com:kibitan/setup_mac.git
$ ./setup.sh
```

* if `permittion denied` happen, then try `sudo chmod 0775 /usr/local/etc`

also setup the [dotfiles](https://github.com/kibitan/dotfiles), with dropbox directory: `ln -s ~/Dropbox/dotfiles ./dotfiles`

## [crontab](./_crontab) bins
 - [bin/backup_dev_dir](./bin/backup_dev_dir)

  compress working directory(ex. `~/www` ), mainly store source codes, and put it under Dropbox directory (ex. `~/Dropbox/www` )

 - [bin/update_brew](./bin/update_brew)

  update installed [HomeBrew](http://brew.sh/) packages

 - [bin/update_brew_cask](./bin/update_brew_cask)

  update installed [Homebrew Cask](https://caskroom.github.io/) packages

 - [bin/update_brewfile](./bin/update_brewfile)

  dump all installed packages by [homebrew-bundle](https://github.com/Homebrew/homebrew-bundle) as [Brewfile](./Brewfile) and commit/push it to remote repository

## change mac setting by [System Preferences](https://support.apple.com/en-us/HT201726)
 - Network
   - Firewall - Turn on

---

 - General
   - Software Update
     - Automatically keep my Mac up to date - enable
     - Install application updates from the App Stire
   - Language & Region
     - set English as Primary
     - add Japanese
     - set Region: Japan
   - Storage
     - Optimize Storage - enable

 - Appearance
   - Appearance: Dark
 - Accessibility
   - Zoom
     - Use scroll gesture with modifier keys - Control
   - display
     - reduce transparent - enable ( http://www.downtown.jp/~soukaku/archives/2014/1029_210751.html )
     - Menubar size: Default
 - Control Center
   - Bluetooth: Show in Menu Bar
   - Sound: Always Show in Menu Bar
   - Other Modules
     - Battery: Don't Show in Menu Bar
   - Menu Bar Only
   - Clock
     - Date
       - Show date: when space - when space allows
       - Show the day of the week - disable time in menu bar
     - Time
       - Style - Digital (if with istat menus - Analog)
       - Display the time with second - enable
     - Spotlight: Don't Show in Menu Bar
    - Siri: Don't Show in Menu Bar
 - Siri & Spotlight
   - disable
   - Spotlight
     - Search Results
       - application
       - calculator
 -  Privacy & Security
   - Firevalut - Turn on
   - enable crontab -> [Granting "Full Disk Access" to `/usr/sbin/cron`](https://www.bejarano.io/fixing-cron-jobs-in-mojave/)

---

 - Desktop & Dock
   - Desktop & stage manager
     - click wallpaer to reveal desktop - only in stage manager
   - Dock
     - Position on screen - left
     - automatic hide - enable
     - add shortcut of Applications
     - customize shortcuts
   - hot corners - Put Display to Sleep
 - Displays
    - Night Shift
      - Schedule: Sunset to Sunrise
    - Advanced
      - Automatically reconnect to any nearby Mac or IPad - enable
 - Screen Saver
   - Desktop
     - Dynamic
   - screen saver
     - show with clock
     - Use random screen saver
  - Battery
     - Prevent automatic sleeping when the display is off - enable

---

 - Lock Screen
   - require password: immediately

---

 - User & Group
   - off the guest

---

 - Touch ID
   - setup fingers

---

 - Internet Accounts
   - AppleID - iCloud
     - Photos - disable
     - iCloud Drive options
       - Desktop & Documents Folder - disable
       - (rest of all) - enable
     - iCloud Mail - disable
     - Passwords & Keychain - enable
     - show more apps
       - Notes - enable
       - Find My Mac - enable
       - Contacts - enable
       - Calender - enable
       - Reminder - disable
       - Safari - enable
       - Stocks - enable
       - Home - disable
       - Wallet - enable
       - Siri - disable
       - Freeform - enable
       - Map - disable
       - Shortcuts - disable
   - Google
     - Contacts
     - Calenders
     - Notes
 - Wallet & Apple Pay
   - setup card

---

 - Keyboard
   - Keyboard:
     - press fn/🌐 key to "Do nothing"
     - (touch bar model) Press fnkey to: show F1, F2, etc. Keys
     - (touch bar model) customize Touch bar
     - Keyboards shortcuts -> Modifier Keys... - Caps Lock(⇪) key: ^Control
   - Shortcuts:
     - Mission Control
       - (first making 10 desktops then) enable desktops shortcuts and change to command + [0-9]
     - Input Sources ( it will appear after setup `Input Sources` section)
       - select the previous input source - option(⌥) + space
       - select next source in input menu - shift + option(⌥) + space
     - Spotlight
       - (if not using raycast) show Spotlight search - control + space
   - Input Sources: ( setup after install google japanese IME )
     - Add "U.S." English keyboard
     - Add "Hiragana (google)" keyboard
     - Remove mac original "Japanese" ( many time freeze )
     - Japanese ( or at `Google Japanese Input Preferences` )
       - change key "¥" button to "\\"
   - dictation
     - on, use enhanced dictation
     - download English and Japanese
 - Trackpad
   - Point & Click
     - secondary click - right corner
     - tap click - enable
     - tracking speed - 2 step down from fastest
   - Scroll & Zoom
     - scroll natural - disable
   - More Gestures
     - swipe between pages - three fingers

## change finder setting
 - Press `Shift+Cmd+.` for showing dot file
 - Preferences
   - General
     - New Finder windows show: home directory
   - Sidebar: customize
   - Advanced:
      - show all filename extensions - enable
      - remove items from the trash after 30 days - enable
      - keep folders on top: in windows when sorting by name - enable
      - when perfoming a search - current folder
 - View (as icon View)
   - Show Preview
   - Show Path Bar
   - Show Status Bar
   - Customize Toolbar
   - Show View Option
     - Group by - None
     - Sort by - Name
     - Icon size - small
     - Show columns
       - Date Modified
       - Date Created
       - Date Last Opened
       - Date Added
       - Size
       - Kind
     - use relative date - disable
     - show library folder - enable
     - click - "Use as default"
 - Select "List View" and Press "Command + J" to open View Options
   - check "Calculate All Sizes" and click "Use as Defaults"
 - change default application of mp3, m4a into QuickTimePlayer by [Get info](https://www.imore.com/how-set-mac-app-default-when-opening-file?upgrade)

## setup force touch
 - do force touch and just "continue"

## apps
### lincense install
 - 1Password
 - istat Menus
 - Bartender
 - Dash
 - Witch
 - Rubymine / Goland

### manually launch
 - Karabiner Elements (or cmd-eikana)
 - 1Password
   - Preference
     - General - menu bar: disable
 - Music (iTunes)
   - Account - Authorizations - Authorize This Computer
   - setup iphone: connect iPhone and "Trust this computer"
 - App store
 - Google Japanese Input
   - Config Dialog.app
     - General - Input from ¥ or backslash key - Backslash \
   - Dictionary tool.app
     - Tools - import to current dictionary - mac_setting/google_japanese_dictionaly
       - TODO: automatic backup/restore, mackup nize?
 - LINE
 - Quiver
   - Preferences:
     - Themea: Dark
     - change library location
       1. Backup: Restore from Backup - `mac_setting/Quiver.qvlibrary`
       2. Sync: Move library - `mac_setting/Quiver.qvlibrary`
     - Advanced: Load Settings - `mac_setting/Quiver-settings.json`
 - Dash
   - Preference: General - Setup Syncing...
     - Set Sync folder(`Dropbox/mac_setting/dash`)
     - check sync option (General Setting, View option, Docsets search profile, Bookmark )
   - Snippet: Snippet library location: `/mac_setting/dash/dash_snippets.dash`
   - enable full-text search manually one-by-one
 - Visual Studio Code
   - enable setting sync
 - Docker
 - Rubymine / Goland
   - enable setting sync
 - mousepose
   - allow security
     - System Preferences - Security & Privacy - Privacy - Accessibility: Mousepose - enable
 - Bdash
   - setup github accesstoken ( need gist scope )
 - BetterTouchTool
 - Tunnelblick
 - Caffeine
 - WhatsApp
 - DeskApp for YouTube

### with auto launch at login
 - Brave
   - sync setting
   - login hatena
   - Chrome menu - Warn Before Quitting - enable
   - import "Mouse Dictionary" eijirou dictionary (C&S/material)
   - Page zoom: 110%
   - install for auto translation: https://github.com/FilipePS/Traduzir-paginas-web
 - iTerm
   - iTerm2 - Preferences - General - Preferences - Load Preferences from custom folder or URL - `mac_setting/iterm_profile`, then reboot
   - iTerm2 - Preferences - General - Save changes - Automatically
   - (Mojave: Mac System Preferences - Security & Privacy - Full disk access, add iTerms2 for updating crontab)
 - Warp
 - Notion
 - raycast
   - import Preferences
   - off the menu bar
 - Dropbox
 - Witch
   - Actions - choose "Cycle Non-Minimized Windows", delete other actions
     - Sort by "Window Activity", Orientation "↓"
     - List windows from all spaces - disable
     - ListTabs - disable
     - ListApps without windows - disable
     - Keyboard - choose Forward "command-tab", Backword "shift-command-tab"
   - Appearance
     - Preset Open - `mac_setting/witch/dark_original.witchlayout`
   - Advances
     - Show list on "display with mouse pointer"
        - Delay - `None` (most left)
     - Cycle through search for .. - disable
 - istat Menus
   - File - Import Settings - `mac_setting/istatmenus/iStat Menus Settings.ismp`
 - bluesnooze
 - Backup and Sync from Google
 - Slack
 - WiFi Signal
 - totalspaces
   - need to change SIP mode on recovery mode `csrutil enable --without debug`, then reboot and `brew cask reinstall totalspaces`, `open $(brew cask info totalspaces | grep $(brew --prefix) | cut -d' ' -f1)/TotalSpaces2.app`
     - https://totalspaces.binaryage.com/elcapitan
     - http://qiita.com/whitefox_105/items/0b70f7a504dcb72788e6
 - Bandwidth+
 - Bartender
   - General
       - Show items in bar below menu bar - enable
       - Bartender menu bar icon - bartender
       - menu bar item spacing - Tiny spacing
    <img width="640" alt="image" src="https://github.com/kibitan/setup_mac/assets/620884/5d2323c4-99c5-4112-879a-785929ded911">

### brew services
 - `brew services start noclamshell`

## widgets
 - Battery & Bluetooth status
 - World clock
 - Weather
 - Stock (currency)

<img width="365" alt="image" src="https://github.com/kibitan/setup_mac/assets/620884/c9594a4b-cef5-4034-852f-7ac771e5c449">

## (only for Apple Silicon)
install iOS apps like lehra, Tuner

# release

## deactivate
see also: https://support.apple.com/en-us/HT201065

 - Music (iTunes)
 - iCloud
 - iMessage
 - https://appleid.apple.com/account/manage
   - https://support.apple.com/en-us/HT205064
 - Dropbox
   - https://www.dropbox.com/account/security
 - Microsoft Office (Office 365)
   - https://portal.office.com/Account#installs
 - Adobe Creative Cloud
   - https://accounts.adobe.com/
   - https://helpx.adobe.com/en/creative-cloud/help/sign-in-out-activate-apps.html
 - google chrome

## reinstall macos
see: https://support.apple.com/en-us/HT204904

tips: no space, no multibyte  character to username/fullname of account
