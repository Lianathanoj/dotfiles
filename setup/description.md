<h1>Initial Setup</h1>

These are the following applications, extensions, and programs that I install whenever I receive a new Macbook.

**Chrome extensions manually installed:**
- [Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb?hl=en) to map some vim keybindings to web shortcuts
- [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en) for ad-blocking
- [Bitwarden](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb?hl=en) for storing personal passwords
- [Lastpass](https://chrome.google.com/webstore/detail/lastpass-free-password-ma/hdokiejnpimakedhajhdlcegeplioahd?hl=en-US) for storing company passwords (note that some companies have other password managers, so default to that if relevant)
- [Zoom Scheduler](https://chrome.google.com/webstore/detail/zoom-scheduler/kgjfgplpablkjnlkjmjdecgdpfankdle?hl=en-US) for scheduling Zoom meetings in Google calendar

**Applications manually installed:**
- [iTerm2](https://iterm2.com/downloads.html) for a better version of terminal
- [VSCode](https://code.visualstudio.com/download) for when I don't want to use Vim
- [Karabiner Elements](https://karabiner-elements.pqrs.org/) (open source) for remapping home and end keys and alt + tab
- [Obsidian](https://obsidian.md/) for notetaking
- [Spotify](https://www.spotify.com/us/download/mac/) for music
- [Scroll Reverser](https://github.com/pilotmoon/Scroll-Reverser) (open source) for separating mouse and trackpad scrolling preferences

**Manual steps after manual installation**
- Go to your Vimium extension and add the following to the "Custom search engines" section:
	- `g: https://github.com/ Github`
	- `r: https://reddit.com/r/ Reddit`
- Add `code` command to PATH for VSCode:
	- to open file in VSCode from current directory using `code .`, you need to download VSCode, open it, type `cmd + shift + P`, and search "**Install code command in path"**
- Place screenshots to a folder instead of home page:
	- send screenshots to a folder by typing `cmd + shift + 5` --> options --> select new folder
- Remap keyboard keys:
	- the first time you open up Karabiner-Elements, follow the prompts and give `karabiner_grabber` and `karabiner_observer` permissions
	- go to the "complex modifications" tab  --> "add rule" --> "import rules from internet"
	- search up "home" and add rules for home and end buttons ([https://ke-complex-modifications.pqrs.org/?q=home](https://ke-complex-modifications.pqrs.org/?q=home)) 
	- search option tab rules to bind option + tab to command + tab (cycle through applications)
	- alternatively, you can import the following `karabiner.json` [here](obsidian://open?vault=All%20Notes&file=Misc%2FKarabiner%20Configuration)
- Create your Github folder in `$HOME/Github`, search for it in Finder, and add it to favorites by moving it to the favorites tab
- Scroll reverser:
	- Add this to Applications and enable security permissions
	- Checkmark "Enable Scroll Reverser"
	- Checkmark "Reverse Vertical"
	- Checkmark "Reverse Horizontal"
	- Checkmark "Reverse Trackpad"
	- Leave "Reverse Mouse" blank
	- Go to "App" --> checkmark "start at login"

**Configuring Dev Environment Preferences:**
- Go to my [setup script](https://github.com/Lianathanoj/dotfiles/blob/master/setup/setup1.sh) and download `setup1.sh`. Run `bash setup1.sh` and fill out any prompts (e.g. password or SSH information). One manual step is copying your Github SSH key from your local config to the remote Github website. TODO: see if you can call an API or use some CLI to do this for better automation.
- This installs my preferences for postgres, tmux, zsh, neovim while also configuring git, homebrew, tmux, goenv, pyenv, virtualenv, nodenv, fzf, and ripgrep.
