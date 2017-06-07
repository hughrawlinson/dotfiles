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
     javascript
     html
     auto-completion
     better-defaults
     dash
     c-c++
     clojure
     colors
     elm
     emacs-lisp
     emoji
     erc
     finance
     git
     github
     groovy
     haskell
     helm
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
     python
     ranger
     react
     ruby
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
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '(recents projects)
   dotspacemacs-startup-recent-list-size 20
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(sanityinc-tomorrow-night
                         solarized-dark
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
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-mode-line-unicode-symbols nil
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
  ;; (spaceline-compile)

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
  (setq clojure-enable-fancify-symbols t)
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
 '(ansi-color-names-vector
   ["#d2ceda" "#f2241f" "#67b11d" "#b1951d" "#3a81c3" "#a31db1" "#21b8c7" "#655370"])
 '(evil-want-Y-yank-to-eol t)
 '(ns-use-native-fullscreen nil)
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-tomorrow define-word rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby rainbow-mode rainbow-identifiers color-identifiers-mode packed ws-butler web-mode use-package toc-org swift-mode spacemacs-theme pug-mode persp-mode orgit org org-plus-contrib org-download neotree live-py-mode ledger-mode intero info+ hide-comnt helm-projectile helm-flx helm-c-yasnippet helm-ag gitattributes-mode git-gutter-fringe expand-region evil-surround evil-mc evil-matchit evil-escape evil-anzu eshell-z drupal-mode clj-refactor cider clojure-mode cargo auto-complete auctex smartparens flycheck haskell-mode company request helm helm-core skewer-mode js2-mode simple-httpd magit magit-popup git-commit with-editor hydra yasnippet php-mode rust-mode yapfify yaml-mode xterm-color xkcd window-numbering which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen toml-mode tagedit spaceline solarized-theme smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder restart-emacs ranger rainbow-delimiters racer queue quelpa pyvenv pytest pyenv-mode py-isort popwin pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pcre2el pbcopy paredit paradox osx-trash osx-dictionary org-projectile org-present org-pomodoro org-bullets open-junk-file mwim multi-term move-text mmm-mode markdown-toc magit-gitflow magit-gh-pulls macrostep lua-mode lorem-ipsum livid-mode linum-relative link-hint less-css-mode launchctl json-mode js2-refactor js-doc inflections indent-guide ido-vertical-mode ibuffer-projectile hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-mode-manager helm-make helm-hoogle helm-gitignore helm-descbinds helm-dash helm-css-scss helm-company haskell-snippets google-translate golden-ratio gnuplot github-search github-clone github-browse-file gitconfig-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter gist gh-md flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-ledger flycheck-haskell flycheck-elm flx-ido fill-column-indicator fancy-battery eyebrowse exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-ediff evil-args eshell-prompt-extras esh-help erc-yt erc-view-log erc-terminal-notifier erc-social-graph erc-image erc-hl-nicks emoji-cheat-sheet-plus emmet-mode elm-mode elisp-slime-nav edn dumb-jump disaster diminish diff-hl dash-at-point cython-mode company-web company-tern company-statistics company-ghci company-ghc company-emoji company-cabal company-c-headers company-auctex company-anaconda column-enforce-mode coffee-mode cmm-mode cmake-mode clojure-snippets clean-aindent-mode clang-format cider-eval-sexp-fu bind-key auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile async anzu aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t))
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(paradox-github-token t)
   (setq-default
    standard-indent 2
    tab-width 2
    indent-tabs-mode nil
    js-indent-level 2
    js2-basic-offset 2
    js2-strict-semi-warning nil
    js2-missing-semi-one-line-override nil
    web-mode-markup-indent-offset 2
    web-mode-css-indent-offset 2
    web-mode-code-indent-offset 2
    web-mode-indent-style 2
    )
   (custom-set-faces
    ;; custom-set-faces was added by Custom.
    ;; If you edit it by hand, you could mess it up, so be careful.
    ;; Your init file should contain only one such instance.
    ;; If there is more than one, they won't work right.
    '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
    '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
   )
