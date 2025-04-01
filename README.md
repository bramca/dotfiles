# Editor Configs
This repo contains configuration files for multiple text editors on multiple OS'es.

# Folder Structure
The folders are divided per text editor.<br>

example
``` text
.
├── README.md
├── doom
│   ├── config.el
│   ├── custom.el
│   ├── init.el
│   └── packages.el
├── emacs
├── nvim
│   ├── lazy
│   │   ├── data
│   │   │   └── telescope-sources
│   │   │       └── my_symbols.json
│   │   ├── init.lua
│   │   └── lua
│   │       ├── keymaps.lua
│   │       ├── launch.lua
│   │       ├── opts.lua
│   │       └── plugins
│   │           ├── autopairs.lua
│   │           ├── bufferline.lua
│   │           ├── colorizer.lua
│   │           ├── colorscheme.lua
│   │           └── yazi.lua
│   └── packer
│       └── init.lua
├── spacemacs
│   └── windows
├── tmux
├── vim
└── vscode
    ├── macos
    │   ├── keybindings.json
    │   └── settings.json
    └── windows
        ├── keybindings.json
        └── settings.json
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
