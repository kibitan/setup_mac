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


## [crontab](./_crontab) bins
 - [bin/backup_dev_dir](./bin/backup_dev_dir)

  compress working directory(ex. `~/www` ), mainly store source codes, and put it under Dropbox directory (ex. `~/Dropbox/www` )

 - [bin/update_brew](./bin/update_brew)

  update installed [HomeBrew](http://brew.sh/) packages

 - [bin/update_brew_cask](./bin/update_brew_cask)

  update installed [Homebrew Cask](https://caskroom.github.io/) packages

 - [bin/update_brewfile](./bin/update_brewfile)

  dump all installed packages by [homebrew-bundle](https://github.com/Homebrew/homebrew-bundle) as [Brewfile](./Brewfile) and commit/push it to remote repository

## [ruby/init.sh](./ruby/init.sh)

(not documented yet)

## change mac setting by [System Preferences](https://support.apple.com/en-us/HT201726)
 - General
   - Appearance: Dark
 - Desktop & Screen Saver
   - Desktop
     - Dynamic
   - screen saver
     - show with clock
     - Use random screen saver
 - Dock & Manu Bar
   - Dock
     - Position on screen - left
     - automatic hide - enable
     - add shortcut of Applications
     - customize shortcuts
   - Clock
     - Time Options: Analog
   - Battery
     - Show in Menu Bar - disable
   - Spotlight
     - Show in Menu Bar - disable     
 - Mission Control
   - hotcorner - Put Display to Sleep
 - Siri
   - disable
   - show siri in menu bar - disable
 - Spotlight
   - Search Results
     - application
     - calculator
 - Language & Region
   - set English as Primary
   - add Japanese
   - set Region: Japan
 - Notifications
    - turn on DoNotDisturb:
      - From: 22:00 ~ 7:00
      - when the display is sleeping

 - Wallet & Apple Pay
   - setup card
 - Touch ID
   - setup fingers
 - User & Group
   - off the guest
   - Login Options: "Show fast user switching menu as" - disable
 - Accessibility
   - Zoom
     - Use scroll gesture with modifier keys - Control
   - display
     - reduce transparent - enable ( http://www.downtown.jp/~soukaku/archives/2014/1029_210751.html )
 - Security & Privacy
   - General
     - require password immediately
   - Firevalut - Turn on
   - Firewall - Turn on
   - Privacy 
     - enable crontab -> [Granting "Full Disk Access" to `/usr/sbin/cron`](https://www.bejarano.io/fixing-cron-jobs-in-mojave/) 

 - Software Update
   - Automatically keep my Mac up to date - enable
 - Sound
   - show volume in menu bar - enable "always"
 - Keyboard
   - Keyboard:
     - press fn/🌐 key to "Show Emoji & Symbols"
     - (touch bar model) Press fnkey to: show F1, F2, etc. Keys
     - (touch bar model) customize Touch bar
     - (change capslock to control key is handled by karabiner-element) or
        - Modifier Keys... - Caps Lock(⇪) key: ^Control
   - Shortcuts:
     - Mission Control
       - (first making 10 desktops then) enable desktops shortcuts and change to command + [0-9]
     - Input Sources ( it will appear after setup `Input Sources` section)
       - select the previous input source - option(⌥) + space
       - select next source in input menu - shift + option(⌥) + space
     - Spotlight
       - (if not using alfred) show Spotlight search - control + space
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


 - Displays
    - Display: change screen size if retina
    - Night Shift
      - Schedule: Sunset to Sunrise
 - Battery
   - Battery:
     - show battery status in menu bar - disable ( use istat menus instead )
   - Power Adapter:
     - Prevent computer from sleeping automatically when the display is off - enable
     - Put hard disks to sleep when possible ( [SSD is not affect this setting](https://support.apple.com/en-us/HT202824) ) - disable
 - Date and Time
   - Clock
     - Show date and time in menu bar - disable ( use istat menus instead )


 - AppleID - iCloud
   - iCloud Drive options
     - Desktop & Documents Folder - disable
     - (rest of all) - enable
   - Photos - disable
   - Mail - disable
   - Contacts - enable
   - Calender - enable
   - Reminder - disable
   - Safari - enable
   - Notes - enable
   - Siri - disable
   - Keychain - enable
   - Find My Mac - enable
   - Stocks - enable
   - Home - disable

## change finder setting
 - Press `Shift+Cmd+.` for showing dot file
 - Prefferences
   - General
     - New Finder windows show: home directory
   - Sidebar: customize
   - Advanced:
      - show all filename extensions - enable
      - remove items from the trash after 30 days - enable
      - keep folders on top: in windows when sorting by name - enable
      - when perfoming a search - current folder
 - View
   - Show Preview
   - Show Path Bar
   - Show Status Bar
   - Customize Toolbar
   - Show View Option
     - Group by - None
     - Sort by - Name
     - Icon size - 80 x 80
     - Show item info
     - Background -
     - click - "Use as default"
   - Customize Touch Bar
 - change default application of mp3, m4a into QuickTimePlayer by [Get info](https://www.imore.com/how-set-mac-app-default-when-opening-file?upgrade)

## setup force touch
 - do force touch and just "continue"

## change storage setting by [Storage Management](https://support.apple.com/en-us/HT206996) ( apple menu - About This Mac - Storage - Manage )
 - Optimize Storage - enable
 - Empty Trash Automatically - enable

## apps
### lincense install
 - 1Password
 - istat Menus
 - Bartender
 - Microsoft Office (Office 365)
 - Adobe Creative Cloud
   - `open $(brew cask info adobe-creative-cloud | grep $(brew --prefix) | cut -d' ' -f1)/Creative Cloud Installer.app`
 - Dash
 - Synergy
   - if not available keyboard in mac, preferrence > keyboard > input source, add "Unicode Hex Input"
 - BetterTouchTool
 - Witch
 - Rubymine
 - Alfred

### manually launch
 - Karabiner Elements
 - 1Password
   - Preference - Advanced - Enable Spotlight and 3rd party app integrations: enable ( for alfred extension)
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
 - Visual Studio Code
   - install [Setting sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) and restart (activate extension and download)
 - Docker
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
   - login hatena
   - set github token to octotree
   - Chrome menu - Warn Before Quitting - enable
   - import "Mouse Dictionary" eijirou dictionary (C&S/material)
   - Page zoom: 110%
 - iTerm
   - iTerm2 - Preferences - General - Preferences - Load Preferences from custom folder or URL - `mac_setting/iterm_profile`, then reboot
   - iTerm2 - Preferences - General - Save changes - Automatically
   - (Mojave: Mac System Preferences - Security & Privacy - Full disk access, add iTerms2 for updating crontab)
 - Warp
 - Notion
 - Alfred4
   - Advanced
      - Syncing - ~/Dropbox/mac_setting/alfred
   - General
      - change shortcut to "ctrl + space"
   - Features
      - Clipboard Historu
        - enable "Keop Plain Text"
        - enable "Keep Images"
        - enable "Keep File Lists"
      - 1password
        - enable 1password bookmarks (enable 1password side configuration as well ( Enable Spotlight and 3rd party integration )
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
   - File - Import Settings - `mac_setting/iStat Menus Settings.ismp`
 - Shiftit
 - Bartender
 - Backup and Sync from Google
 - PopClip
 - Slack
 - WiFi Signal
 - totalspaces
   - need to change SIP mode on recovery mode `csrutil enable --without debug`, then reboot and `brew cask reinstall totalspaces`, `open $(brew cask info totalspaces | grep $(brew --prefix) | cut -d' ' -f1)/TotalSpaces2.app`
     - https://totalspaces.binaryage.com/elcapitan
     - http://qiita.com/whitefox_105/items/0b70f7a504dcb72788e6
 - Bandwidth+

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
