setup mac

# change mac setting
- mission control
  - hotcorner screenlock
  - turn on dashboard as space
- security
  - firewall
  - firevalut
  - require password immediately
- spotlight
  - Search Results: only check  application
- energy
  - display off time
  - stop sleeping when pluged
    - disable put hard disks to sleep when possible ( [SSD is not affect this setting](https://support.apple.com/en-us/HT202824) )
    - enable prevent computer from sleeping automatically when the display is off
- trackpad
  - tap click
  - right click
  - scroll natural
  - tracking speed
  - swipe between pages -> three fingers
- user
  - off the guest
- accessibility
  - Zoom: Use scroll gesture with modifier keys
  - display: turn on reduce transmit
    - (http://www.downtown.jp/~soukaku/archives/2014/1029_210751.html)
- dock setting
  - auto hide
  - layout
  - add shortcut of Applications 
- sound
  - show in menu bar
- general
  - change menubar and Dock color
- finder
  - prefference
    - General
      - New Finder windows show: home directory
    - sidebar: customize
    - advanced:
      - show all filename extensions
      - remove items from the trash after 30 days
      - keep folders on top when sorting by name
      - when perfoming a search: current folder
  - view
    - show status bar
    - show path bar
  - default view option: sort by name, arrange by none
  - change default application of mp3, m4a into QuickTimePlayer
- change screen size if retina
- screensaver
  - random
  - show with clock
- keyboard
  - keyboard:
    - fnkey
    - Capslock to control
    - show keyboard and emoji viewer in menu bar
    - (touch bar)
      - customize control strip
  - shortcut:
    - spotlight -> control + space
    - input source -> alt + space
    - Full Keyboard access -> all controls
    - mission control -> (first making 10 desktops then) enable desktops shortcuts and change to alt+*
  - input source:
    - change key "¥" button to '\'
    - should be disable mac original IME ( many time freeze )
- notification setting
  - turn on DoNotDistrurb at display off
- turn off clock, battery, siri from menubar

- see also: https://paper.dropbox.com/doc/Effective-Mac-Mac-ec4qEn9JCZbbLFtWn8wFL

# run init.sh
 - if 'permittion denied' happen, then `sudo chmod 0775 /usr/local/etc`

# download and install ms-office365
  - https://portal.office.com/OLS/MySoftware.aspx

# launch apps
 - chrome
 - iterm
 - dropbox
 - witch
   - first done and relaunch again then, setup key to command-tab 
 - istatmenu
 - clipy
 - shiftit
 - bartender
 - google-drive
  - check selective sync
 - flux
 - popclip
 - slack
 - caffeine
 - google japanese ime (keyboard - input source)
 - freeman
 - wifi signal
 - hub command
 - cmd-eikana
 - totalspaces
  - need to change SIP mode on recovery mode `csrutil enable --without debug`, then reboot and `brew cask reinstall totalspaces`, `open $(brew cask info totalspaces | grep $(brew --prefix) | cut -d' ' -f1)/TotalSpaces2.app`
    - https://totalspaces.binaryage.com/elcapitan
    - http://qiita.com/whitefox_105/items/0b70f7a504dcb72788e6

# lincense install
 - 1password
 - istat menu
 - bartender
 - ms office
 - dash
 - synergy
  - if not available keyboard in mac, preferrence > keyboard > input source, add "Unicode Hex Input"
 - totalspaces
 - jasper

# chrome login
 - hatena
 - octotree
