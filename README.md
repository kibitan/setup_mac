#### related document
  - (japanese) [Mac 環境構築の自動化 2015年末版 ( homebrew + homebrew-cask + homebrew-brewdle + mackup + crontab + mas-cli ) - Qiita](http://qiita.com/kibitan/items/d564248eeaebbf003edc)



# setup

## run [setup.sh](./setup.sh)
```bash
$ git clone git@github.com:kibitan/setup_mac.git ~/setup_mac
$ cd ~/setup_mac
$ ./setup.sh
```

* if `permittion denied` happen, then try `sudo chmod 0775 /usr/local/etc`

* if `Permission denied (publickey).` happen and not import `.ssh` yet, then try to use `$ git clone https://github.com/kibitan/setup_mac.git ~/setup_mac`

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
   - use dark menu bar and Dock
   - (Mojave) Appearance: Dark
 - Desktop & Screen Saver
   - random
   - show with clock
 - Dock
   - auto hide - enable
   - layout - left
   - add shortcut of Applications
   - customize shortcuts
 - Mission Control
   - hotcorner - Put Display to Sleep
   - turn on dashboard as space
 - Language & Region
   - set English as Primary
   - add Japanese
   - set Region: Japan
 - Security & Privacy
   - General
     - require password immediately
   - Firevalut - Turn on
   - Firewall - Turn on
 - Spotlight
   - Search Results
     - application
     - calculator
 - Notifications
    - turn on DoNotDisturb:
      - From: 22:00 ~ 7:00
      - when the display is sleeping


 - Displays
    - Display: change screen size if retina
    - Night Shift
      - Schedule: Sunset to Sunrise
 - Energy Saver
   - Power Adapter:
     - Prevent computer from sleeping automatically when the display is off - enable
     - Put hard disks to sleep when possible ( [SSD is not affect this setting](https://support.apple.com/en-us/HT202824) ) - disable
   - show battery status in menu bar - disable ( use istat menus instead )
 - Keyboard
   - Keyboard:
     - (touch bar model) fnkey - Expanded Control Strip
     - show keyboard and emoji viewer in menu bar
     - (touch bar model) customize Touch bar
     - (Switch Capslock will handle with karabiner-element)
   - Shortcuts:
     - Mission Control
       - (first making 10 desktops then) enable desktops shortcuts and change to command + [0-9]
     - Input Sources ( it will appear after setup `Input Sources` section)
       - select the previous input source - alt + space
       - select next source in input menu - shift + alt + space
     - Spotlight

       - show Spotlight search - control + space
     - (touch bar model?) Full Keyboard Access - all controls

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
     - tracking speed - 4 step down from fastest
   - Scroll & Zoom
     - scroll natural - disable
   - More Gestures
     - swipe between pages - three fingers
 - Sound
   - show volume in menu bar


 - iCloud
   - iCloud Drive options
     - Desktop & Documents Folder - disable
     - (rest of all) - enable
   - Notes - enable
   - Photos options
     - iCloud Photos - disable
     - My Photo Stream - enable
     - Shared Album - enable
   - Keychain - enable
   - Find My Mac - enable
 - Wallet & Apple Pay
   - setup card
 - Software Update
   - Automatically keep my Mac up to date - enable


- User & Group
   - off the guest
   - Login Options: "Show fast user switching menu as" - disable
 - Siri
   - disable
   - show siri in menu bar - disable
 - Date and Time
   - Clock
     - Show date and time in menu bar - disable ( use istat menus instead )
 - Accessibility
   - Zoom
     - Use scroll gesture with modifier keys - Control
   - display
     - reduce transparent - enable ( http://www.downtown.jp/~soukaku/archives/2014/1029_210751.html )

## change finder setting
 - Press `Shift+Cmd+.` for showing dot file
 - Prefferences
   - General
     - New Finder windows show: home directory
   - Sidebar: customize
   - Advanced:
      - show all filename extensions - enable
      - remove items from the trash after 30 days - enable
      - keep folders on top when sorting by name - enable
      - when perfoming a search - current folder
 - View
   - Show Path Bar
   - Show Status Bar
   - Customize Toolbar
   - Show View Option
     - Group by - None
     - Sort by - Name
     - Icon size - 140 x 140
     - Show item info
     - Background - 
     - click - "Use as default"
   - Customize Touch Bar
 - change default application of mp3, m4a into QuickTimePlayer by [Get info](https://www.imore.com/how-set-mac-app-default-when-opening-file?upgrade)


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
 - Jasper
 - Witch

### manually launch
 - Karabiner Elements
 - 1Password
 - iTunes
   - Account - Authorizations - Authorize This Computer
   - setup iphone
 - Mousepose
 - Google Japanese Input (keyboard - input source)
   - General: Input from ¥ or backslash key - Backslash \
   - setup user dictionally - mac_setting/google_japanese_dictionaly
     - TODO: automatic backup/restore, mackup nize?
 - LINE
 - hub command
 - Quiver
   - Preferences
     - Default Cell Type: Markdown cell
     - Themes: Spacegray
     - Sync - Library Location: `mac_setting/Quiver.qvlibrary`
 - Tweetbot
 - Dash
 - Atom
   - `$ apm install package-sync`
   - command+shift+p, run `Package Sync: Sync`
 - Bdash
   - setup github accesstoken ( need gist scope )
 - Docker
 - BetterTouchTool
 - (Evernote)
 - Tunnelblick
 - Caffeine
 - WhatsApp
 - DeskApp for YouTube
 - Visual Studio Code
   - install [Setting sync](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) and restart (activate extension and download)

### with auto launch at login
 - Chrome
   - login hatena
   - set github token to octotree
   - import session buddy
   - Chrome menu - Warn Before Quitting - enable
 - iTerm
   - iTerm2 - Preferences - General - Load Preferences from custom folder or URL - `mac_setting/iterm_profile`, then reboot
   - iTerm2 - Preferences - General - Save changes to folder when iTerm2 quits
   - (from Mojave: Mac System Preferences - Security & Privacy - Full disk access, add iTerms2 for updating crontab)
 - Dropbox
 - Witch
   - Actions - choose "Cycle Non-Minimized Windows", delete other actions
     - Sort by "Window Activity", Orientation "↓"
     - ListTabs - disable
     - ListApps without windows - disable
     - Keyboard - choose Forward "command-tab", Backword "shift-command-tab"
   - Appearance
     - Preset Open - `mac_setting/witch/dark_original.witchlayout` 
   - Advances
     - Enable search for .. - disable
     - Show list on "display with mouse pointer"
 - istat Menus
   - File - Import Settings - `mac_setting/iStat Menus Settings.ismp`
 - Clipy
   - Edit Snipetts - import - `mac_setting/snippets.xml`
 - Shiftit
 - Bartender
 - Backup and Sync from Google
 - Rambox
 - PopClip
 - Slack
 - WiFi Signal
 - totalspaces
   - need to change SIP mode on recovery mode `csrutil enable --without debug`, then reboot and `brew cask reinstall totalspaces`, `open $(brew cask info totalspaces | grep $(brew --prefix) | cut -d' ' -f1)/TotalSpaces2.app`
     - https://totalspaces.binaryage.com/elcapitan
     - http://qiita.com/whitefox_105/items/0b70f7a504dcb72788e6
 - Bandwidth+
 - Dash ( snippets )
   - Preference: General - Setup Syncing...
     - Set Sync folder(`Dropbox/mac_setting/dash`)
     - check sync option (General Setting, View option, Docsets search profile, Bookmark )

# release

## deactivate
see also: https://support.apple.com/en-us/HT201065

 - iTunes
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
 - Evernote
   - https://www.evernote.com/Devices.action
 - google chrome

## reinstall macos
see: https://support.apple.com/en-us/HT204904

tips: no space, no multibyte  character to username/fullname of account
