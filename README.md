# dotfiles
This repo contains configuration files for various tools in a folder convention so it can be used with [GNU Stow](https://www.gnu.org/software/stow/).<br>
Just clone this repo in the `~` folder and run `stow [package]`

# Folder Structure
The folders are according to the `stow` convention with the config files stored per package as a folder.<br>

example
``` text
.
├── doom-emacs
│   └── .config
│       └── doom
│           ├── config.el
│           ├── init.el
│           └── packages.el
├── emacs
│   └── .emacs.d
│       └── init.el
├── nvim
│   └── .config
│       └── nvim
│           ├── init.lua
│           └── lua
│               ├── keymaps.lua
│               ├── launch.lua
│               ├── opts.lua
│               └── plugins
├── tmux
│   └── .tmux.conf
├── vim
│   └── .vimrc
└── wezterm
    └── .wezterm.lua
```

# Useful Tools

## CLI Tools

- [ripgrep](https://github.com/BurntSushi/ripgrep): faster grep
- [fd](https://github.com/sharkdp/fd): faster file search
- [fzf](https://github.com/junegunn/fzf): fuzzy find stuff
- [btop](https://github.com/aristocratos/btop): checking processes in the terminal (better version of `top`)
- [tldr](https://tldr.sh/): TLDR man pages
- [stow](https://www.gnu.org/software/stow/): better dotfile management

## TUI Tools

- [lazygit](https://github.com/jesseduffield/lazygit): terminal ui for git doing git commands
- [lazydocker](https://github.com/jesseduffield/lazydocker): terminal docker container management
- [lazysql](https://github.com/jorgerojas26/lazysql): terminal database management
- [yazi](https://github.com/sxyazi/yazi): terminal file manager
- [gocovsh](https://github.com/orlangure/gocovsh): go test coverage in terminal
- [opencode](https://opencode.ai/): using the powers of AI agents
- [lynx](https://lynx.browser.org/): terminal browser
- [postui](https://github.com/bramca/postui): run and test API requests

## Other Stuff

- [wezterm](https://wezterm.org/): nice terminal emulator
- [nvim](https://neovim.io/): main text editor of choice
- [tmux](https://github.com/tmux/tmux/wiki): terminal multiplexer
- [tmux-mem-cpu-load](https://github.com/thewtex/tmux-mem-cpu-load): see memory and cpu load in tmux status bar
- [oh-by-bash](https://github.com/ohmybash/oh-my-bash): level up for bashrc
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh): level up for zhsrc
- [imagemagick](https://imagemagick.org/script/download.php): image processing in the terminal
