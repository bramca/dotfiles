;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default c-basic-offset tab-width)
(setq-default cperl-indent-level tab-width)
(setq ring-bell-function 'ignore)

(electric-pair-mode 1)
(scroll-bar-mode -1)
(delete-selection-mode 1)
(tool-bar-mode -1)
(show-paren-mode 1)
(menu-bar-mode -1)

(add-hook 'before-save-hook 'my-prog-nuke-trailing-whitespace)

(defun my-prog-nuke-trailing-whitespace ()
  (when (derived-mode-p 'prog-mode)
        (delete-trailing-whitespace)))

(global-set-key (kbd "C-x C-j") 'clipboard-yank)

(require 'evil)
(evil-mode 1)

(require 'expand-region)
(global-set-key (kbd "M-+") 'er/expand-region)

(require 'multiple-cursors)
(global-set-key (kbd "C-c C-d") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(move-text-default-bindings)
(set-face-attribute 'default nil :height 120)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "https://melpa.org/packages/")
   )
  )

;; (global-undo-tree-mode)
;; (global-auto-complete-mode t)
(add-hook 'python-mode-hook
          (lambda () (setq python-indent-offset 4)))
(defalias 'perl-mode 'cperl-mode)
(defalias 'javascript-mode 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.json\\'" . js-mode))
(eval-after-load "artist"
  '(define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation)
  )
;; (when window-system
;;   (set-frame-position (selected-frame) 455 23)
;;   (set-frame-size (selected-frame) 138 60))

;; (defun toggle-fullscreen ()
;;   (interactive)
;;   (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
;;                                            nil
;;                                            'fullboth)))
;; (global-set-key (kbd "C-M-<") 'toggle-fullscreen)

(defun wrap-html-tag (tagName)
  "Add a tag to beginning and ending of current word or text selection."
  (interactive "sEnter tag name: ")
  (let (p1 p2 inputText)
    (if (use-region-p)
        (progn
          (setq p1 (region-beginning) )
          (setq p2 (region-end) )
          )
      (let ((bds (bounds-of-thing-at-point 'symbol)))
        (setq p1 (car bds) )
        (setq p2 (cdr bds) ) ) )

    (goto-char p2)
    (insert "</" tagName ">")
    (goto-char p1)
    (insert "<" tagName ">")
    ))
(defun wrap-lines-in-region-with-tag (b e tag)
  "'tag' every line in the region with a tag"
  (interactive "r\nMTag for line: ")
  (save-restriction
    (narrow-to-region b e)
    (save-excursion
      (goto-char (point-min))
      (while (< (point) (point-max))
        (beginning-of-line)
        (insert (format "<%s>" tag))
        (end-of-line)
        (insert (format "</%s>" tag))
        (forward-line 1)))))

(setq make-backup-files nil)

;; execute org code blocks
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)
                             (python . t)))

;; buffer on startup
;; (setq initial-buffer-choice "~")
;; (load-theme 'tsdh-dark)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "2a739405edf418b8581dcd176aaf695d319f99e3488224a3c495cb0f9fd814e3" default))
 '(package-selected-packages
   '(magit farmhouse-theme org-present pyvenv markdown-mode go-mode zenburn-theme typescript-mode tablist svg solarized-theme pug-mode powerline pacmacs multiple-cursors move-text moe-theme minimap lua-mode json-reformat json-mode js2-mode expand-region evil ess dizzee company-tabnine color-theme-sanityinc-tomorrow chess challenger-deep-theme autotetris-mode auto-complete 2048-game)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'farmhouse-dark)
