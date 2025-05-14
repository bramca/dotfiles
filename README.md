# Editor Configs
This repo contains configuration files for various tools in a folder convention so it can be used with [GNU Stow](https://www.gnu.org/software/stow/).<br>
Just clone this repo in the `~` folder and run `stow [package]`

# Folder Structure
The folders are according to the `stow` convention with the config files stored per package as a folder.<br>

example
``` text
.
├── doom-emacs
│   └── .doom.d
│       ├── config.el
│       ├── init.el
│       └── packages.el
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

# Useful External Tools
These are some external command line tools that can be useful to integrate in the editor.

- [ripgrep](https://github.com/BurntSushi/ripgrep): faster grep
- [fd](https://github.com/sharkdp/fd): faster file search
- [btop](https://github.com/aristocratos/btop): checking processes in the terminal (better version of `top`)
- [lazygit](https://github.com/jesseduffield/lazygit): terminal ui for git doing git commands
- [yazi](https://github.com/sxyazi/yazi): terminal file manager
- [tmux](https://github.com/tmux/tmux/wiki): terminal multiplexer
- [tmux-mem-cpu-load](https://github.com/thewtex/tmux-mem-cpu-load): see memory and cpu load in tmux status bar
- [powerlevel10k](https://github.com/romkatv/powerlevel10k): nice terminal theme
- [lazydocker](https://github.com/jesseduffield/lazydocker): terminal docker container management
- [lazysql](https://github.com/jorgerojas26/lazysql): terminal database management
- [wezterm](https://wezterm.org/): nice terminal emulator
- [stow](https://www.gnu.org/software/stow/): for better dotfile management
