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
 - Desktop & Screen Saver
   - random
   - show with clock
 - Dock
   - auto hide - enable
   - layout - left
   - add shortcut of Applications
   - customize shortcuts
 - Mission Control
   - hotcorner screenlock
   - turn on dashboard as space
 - Language & Region
   - set English as Primary
   - add Japanese
   - set Region: Japan
 - Security & Privacy
   - firewall
   - firevalut
   - require password immediately
 - Spotlight
   - Search Results: only check application
 - Notifications
    - turn on DoNotDisturb at display is sleepin


 - Displays
    - turn on Night Shift
    - change screen size if retina
 - Energy Saver
   - display off time
   - stop sleeping when pluged
     - disable put hard disks to sleep when possible ( [SSD is not affect this setting](https://support.apple.com/en-us/HT202824) )
     - enable prevent computer from sleeping automatically when the display is off
   - battery status in menu bar - disable ( use istat menus instead )
 - Keyboard
   - Keyboard:
     - fnkey - Show F1 F2, etc, keys
     - Modifier Keys: Capslock to control
     - show keyboard and emoji viewer in menu bar
     - customize control strip (touch bar)
   - Shortcuts:
     - Mission Control
       - (first making 10 desktops then) enable desktops shortcuts and change to command + *
     - Input Sources
       - select the previous input source - alt + space
       - select next source in input menu - shift + alt + space
     - Spotlight
       - Show Spotlight search - control + space
     - Full Keyboard Access - all controls
   - Input Sources:
     - disable mac original japanese IME ( many time freeze )
     - Japanese
       - change key "¥" button to '\'
   - dictation
     - on, use enhanced dictation
     - download English and Japanese
 - Trackpad
   - secondary click - right corner
   - tap click - enable
   - tracking speed
   - scroll natural - disable
   - swipe between pages - three fingers
 - Sound
   - show in menu bar


 - User & Group
   - off the guest
 - Siri
   - disable
   - show siri in menu bar - disable
 - Date and Time
   - disable show date and time in menu bar ( use istat menus instead )
 - Accessibility
   - Zoom: Use scroll gesture with modifier keys
   - display: turn on reduce transparent
     - http://www.downtown.jp/~soukaku/archives/2014/1029_210751.html

## change finder setting
 - Prefferences
   - General
     - New Finder windows show: home directory
   - sidebar: customize
   - advanced:
      - show all filename extensions - enable
      - remove items from the trash after 30 days - enable
      - keep folders on top when sorting by name - enable
      - when perfoming a search - current folder
 - View
   - Show Path Bar
   - Show Status Bar
   - Show View Option
     - arrange by none, sort by name
     - Icon size - 220 x 220
     - click: use as default
   - Customize Toolbar
   - Customize Touch Bar
 - change default application of mp3, m4a into QuickTimePlayer by [Get info](https://www.imore.com/how-set-mac-app-default-when-opening-file?upgrade)


## change storage setting by [Storage Management](https://support.apple.com/en-us/HT206996) ( apple menu - About This Mac - Storage - Manage )
 - turn on Optimize Storage
 - turn on Empty Trash Automatically

## apps
### lincense install
 - 1password
 - istat menus
 - bartender
 - microsoft office (office 365)
 - adobe creative cloud
   - `open $(brew cask info adobe-creative-cloud | grep $(brew --prefix) | cut -d' ' -f1)/Creative Cloud Installer.app`
 - dash
 - synergy
   - if not available keyboard in mac, preferrence > keyboard > input source, add "Unicode Hex Input"
 - better touch tool
 - jasper

### manually launch
 - 1password
 - itunes
   - Account - Authorizations - Authorize This Computer
   - setup iphone
 - Mousepose
 - google japanese ime (keyboard - input source)
   - setup user dictionally (manually)
 - LINE
 - hub command
 - quiver
   - Preferences - Sync - Library Location - `mac_setting/Quiver.qvlibrary`
 - tweet bot
 - dash
 - atom
   - `$ apm install package-sync`
   - command+shift+p, run `Package Sync: Sync`
 - bdash
   - setup github accesstoken ( need gist scope )
 - docker
 - better touch tool
 - (evernote)
 - tunnelblick
 - caffeine
 - WhatsApp
 - DeskApp for youtube

### with auto launch at login
 - chrome
   - login hatena
   - set github token to octotree
   - import session buddy
   - Chrome menu - Warn Before Quitting - enable
 - iterm
   - iTerm2 - Preferences - General - Load Preferences from custom folder or URL - `mac_setting/iterm_profile`, then reboot
   - iTerm2 - Preferences - General - Save changes to folder when iTerm2 quits
 - dropbox
 - witch
   - first done and relaunch again then, setup key to command-tab
   - show list - right away
   - disable - Show an "Active" item 
 - witch4
   - Actions - Sort by - Window Activity
   - Actions - ListTabs - disable
   - Advances - Enable search for .. - disable
 - istat menus
 - clipy
   - Edit Snipetts - import - `mac_setting/snippets.xml`
 - shiftit
 - bartender
 - Backup and Sync from Google
 - rambox
 - popclip
 - slack
 - wifi signal
 - cmd-eikana
 - totalspaces
   - need to change SIP mode on recovery mode `csrutil enable --without debug`, then reboot and `brew cask reinstall totalspaces`, `open $(brew cask info totalspaces | grep $(brew --prefix) | cut -d' ' -f1)/TotalSpaces2.app`
     - https://totalspaces.binaryage.com/elcapitan
     - http://qiita.com/whitefox_105/items/0b70f7a504dcb72788e6
 - bandwidth+

# release

## deactivate
see also: https://support.apple.com/en-us/HT201065

 - itunes
 - icloud
 - imessage
 - https://appleid.apple.com/account/manage
   - https://support.apple.com/en-us/HT205064
 - dropbox
   - https://www.dropbox.com/account/security
 - microsoft office (office 365)
   - https://portal.office.com/Account#installs
 - adobe creative cloud
   - https://accounts.adobe.com/
   - https://helpx.adobe.com/en/creative-cloud/help/sign-in-out-activate-apps.html
 - evernote
   - https://www.evernote.com/Devices.action

## reinstall macos
see: https://support.apple.com/en-us/HT204904

tips: no space, no multibyte  character to username/fullname of account
