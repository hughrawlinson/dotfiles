;; -*- mode: emacs-lisp -*- This file is loaded by Spacemacs at startup. It must
;; be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     auto-completion
     better-defaults
     dash
     elm
     emacs-lisp
     emoji
     erc
     finance
     git
     github
     haskell
     html
     ibuffer
     javascript
     latex
     lua
     markdown
     octave
     org
     osx
     php
     ranger
     react
     rust
     (shell :variables
            shell-default-shell 'eshell
            shell-default-term-shell "/bin/zsh"
            )
     spell-checking
     swift
     syntax-checking
     version-control
     xkcd
     yaml

     ;; private layers
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '('page-break-lines)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default
   ;; Use https for package download
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update t
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'nil
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-recent-list-size 20
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(solarized-dark
                         solarized-light
                         )
   dotspacemacs-colorize-cursor-according-to-state t
   ;; brew package font-fira-code
   dotspacemacs-default-font '("Fira Code Retina"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-default-layout-name "home"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-enable-paste-micro-state nil
   dotspacemacs-which-key-delay 1.0
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup t
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers 'relative
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; don't run an interactive shell while setting path
  (setq exec-path-from-shell-arguments '("-l"))

  (defalias #'projectile-go-function #'projectile-go)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq powerline-default-separator 'nil)
  ;; for some reason...
  (spaceline-compile)

  (setq company-emoji-insert-unicode t)

  ;; ;; attempt to set emoji font, doesn't currently work
  ;; (defun --set-emoji-font (frame)
  ;;   "Adjust the font settings of FRAME so Emacs can display emoji properly."
  ;;   (if (eq system-type 'darwin)
  ;;       ;; For NS/Cocoa
  ;;       (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") frame 'prepend)
  ;;     ;; For Linux
  ;;     (set-fontset-font t 'symbol (font-spec :family "Symbola") frame 'prepend)))

  ;; ;; For when Emacs is started in GUI mode:
  ;; (--set-emoji-font nil)
  ;; Hook for when a frame is created with emacsclient

  ;; (add-hook 'after-make-frame-functions '--set-emoji-font)

  ;; Macro for killing all dired buffers
  (defun kill-all-dired-buffers ()
    "Kill all dired buffers."
    (interactive)
    (save-excursion
      (let ((count 0))
        (dolist (buffer (buffer-list))
          (set-buffer buffer)
          (when (equal major-mode 'dired-mode)
            (setq count (1+ count)) 
            (kill-buffer buffer)))
        (message "Killed %i dired buffer(s)." count))))

  ;; Try and make indentation work nicely
  (setq-default js2-basic-offset 2)
  (setq-default js-indent-level 2)
  (defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-indent-style 2)
    )
  (add-hook 'web-mode-hook  'my-web-mode-hook)

  ;; Use eslint to lint instead of jshint
  (add-hook 'js2-mode-hook
            (defun my-js2-mode-setup ()
              (flycheck-mode t)
              (when (executable-find "eslint")
                (flycheck-select-checker 'javascript-eslint))))
  (push '("\\.js\\'" . react-mode) auto-mode-alist)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
