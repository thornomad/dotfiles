# thornomad's dotfiles

###Enable zsh (which is new to me):

<https://github.com/robbyrussell/oh-my-zsh>

###Installation

    $ cd ~/Documents # i like them here
    $ git clone git@github.com:thornomad/dotfiles.git
    $ cd dotfiles
    $ rake install

Then link the sublime settings for the mac:

    $ ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

Brew setup:
-----------

    # install homebrew
    # brew tap Homebrew/bundle  # add the repo
    # brew bundle               # run this in the dotfiles folder



### Mac settings:

    # disable auto-backup of itunes devices
    defaults write com.apple.iTunes DeviceBackupsDisabled -bool true

### Web stuff:

    npm install -g browser-sync

