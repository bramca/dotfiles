# Editor Configs
This repo contains configuration files for multiple text editors on multiple OS'es.

# Folder Structure
The folders are divided per text editor, underneath the editor folder are subfolders per OS.<br>

example
``` text
├── doom_emacs
│   ├── macos
│   │   └── .doom.d
│   │       ├── config.el
│   │       ├── custom.el
│   │       ├── init.el
│   │       └── packages.el
│   └── windows
│       └── .doom.d
│           ├── config.el
│           ├── custom.el
│           ├── init.el
│           └── packages.el
├── vim
│   └── linux
│       ├── .tmux.conf
│       └── .vimrc
│
└── vscode
    └── macos
        ├── keybindings.json
        └── settings.json
```

# Useful External Tools
These are some external command line tools that can be useful to integrate in the editor.

- [btop](https://github.com/aristocratos/btop): checking processes in the terminal (better version of `top`)
- [lazygit](https://github.com/jesseduffield/lazygit): terminal ui for git doing git commands
- [yazi](https://github.com/sxyazi/yazi): terminal file manager
