;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Bram Cautaerts"
      user-mail-address "bram.cautaerts@ing.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Source Code Pro" :size 14 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "Source Code Pro" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-solarized-dark)
;; (setq doom-theme 'doom-molokai)
(setq doom-theme 'doom-vibrant)
;; (setq doom-theme 'doom-Iosvkem)
;; (setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq warning-minimum-level :emergency)
;; install company tabnine
(use-package! company-tabnine
  :config
  (setq company-idle-delay 0
        company-show-numbers t))
;; functions for enabling or disabling company tabnine
(defun enable-tabnine ()
  (interactive)
  (when (boundp 'company-backends)
    (make-local-variable 'company-backends)
    (add-to-list 'company-backends #'company-tabnine)
    (setq company-idle-delay 0)
    ))
(defun disable-tabnine ()
  (interactive)
  (when (boundp 'company-backends)
    (make-local-variable 'company-backends)
    (setq company-backends (delete #'company-tabnine company-backends))
    (company-tabnine-kill-process)
    ))

(add-hook
 'python-mode-hook
 (lambda ()
   (flycheck-mode -1))
 )

(add-hook
 'typescript-mode-hook
 (lambda ()
   (flycheck-mode -1))
 )

(add-hook
 'go-mode-hook
 (lambda ()
   (flycheck-mode -1))
 )

(add-hook
 'restclient-mode-hook
 (lambda ()
   (setq gnutls-verify-error nil))
 )

;; for azerty keyboard layout mac
(setq mac-option-modifier nil)
(setq mac-command-modifier 'meta)

;; for perl
(setenv "LC_CTYPE" "en_US.UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")

;; for toolchain
(setenv "JAVA_HOME" "/Library/Java/JavaVirtualMachines/adoptopenjdk-14.jdk/Contents/Home")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; set tab to always indent instead of rigid tab
(setq tab-always-indent t)

;; key bindings
(map! :leader
      :desc "truncate lines"
      "t t" #'toggle-truncate-lines)

(map! :leader
      :desc "go to definition"
      "d" #'evil-goto-definition)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
