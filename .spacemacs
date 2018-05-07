;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     vimscript
     (python :variables
             python-test-runner 'pytest)
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ipython-notebook
     helm
     sql
     markdown
     html
     auto-completion
     emacs-lisp
     git
     colors
     latex
     csv
     markdown
     org
     (shell :variables
            shell-default-shell 'term
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; django
     games
     emoji
     evil-commentary
     ;; Enable Nyan Cat on progress bar
     (colors :variables colors-enable-nyan-cat-progress-bar t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      gscholar-bibtex
                                      py-yapf
                                      yasnippet-snippets
                                      evil-replace-with-register
                                      lsp-mode
                                      lsp-ui
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(info+ help-fns+ hide-comnt)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         rebecca
                         spacemacs-dark
                         solarized-dark
                         spacemacs-light
                         solarized-light
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;; install Hack: sudo apt install fonts-hack-ttf
   dotspacemacs-default-font '("Hack Nerd Font"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; (add-to-list 'default-frame-alist '(fullscreen . fullboth))
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code. It is called immediately after
`dotspacemacs/init', before layer configuration executes. This function is
mostly useful for variables that need to be set before packages are loaded. If
you are unsure, you should try in setting them in `dotspacemacs/user-config'
first."
  ;; Function to map enter
  (defun newline-without-break-of-line-below ()
    "1. move to end of the line.
     2. insert newline with index"
    (interactive)
    (let ((oldpos (point)))
      (end-of-line)
      (newline-and-indent)))
  (defun newline-without-break-of-line-above ()
    "1. move to end of the line.
     2. insert newline with index"
    (interactive)
    (let ((oldpos (point)))
      (beginning-of-line)
      (newline-and-indent)
      (previous-line)))
  ;; To load python templates
  (add-hook 'find-file-hooks 'maybe-load-template)
  (defun maybe-load-template ()
    (interactive)
    (when (and
           (string-match "\\.py$" (buffer-file-name))
           (eq 1 (point-max)))
      (insert-file "~/.templates/header.py"))
    (when (and
           (string-match "\\.tex$" (buffer-file-name))
           (eq 1 (point-max)))
      (insert-file "~/.templates/header.tex")))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."

  ;; Linea para cambiar el tema si se está en una terminal
  ;; (if (not window-system) (spacemacs/load-theme 'spacemacs-dark))
  ;; Modificar numeración de lineas
  (setq paradox-github-token "2e0660a6aae3fde60c1d0de5566f77bbb73d5069")
  (require 'linum)
  (defvar linum-border-width 1 "Border width for linum.")
  (defvar linum-current-line 1 "Current line number.")
  ;; (defvar linum-border-width 1 "Border width for linum.")
  (setq evil-replace-with-register-key (kbd "gr"))
  (evil-replace-with-register-install)
  ;; Defining macros
  (fset 'adapt_bib
        (lambda (&optional arg) "Keyboard macro."
          (interactive "p")
          (kmacro-exec-ring-item (quote ([37 108 126 47 91 49 45 50 93 return 105 45 escape 108 108 108 108 108 100 119 98 98 98 104 37 return return] 0 "%d")) arg)))

  (defface linum-current-line
    `((t :inherit linum
         :foreground "goldenrod"
         :weight bold
         ))
    "Face for displaying the current line number."
    :group 'linum)

  (defadvice linum-update (before advice-linum-update activate)
    "Set the current line."
    (setq linum-current-line (line-number-at-pos)
          ;; It's the same algorithm that linum dynamic. I only had added one
          ;; space in front of the first digit.
          linum-border-width (number-to-string
                              (+ 1 (length
                                    (number-to-string
                                     (count-lines (point-min) (point-max))))))))

  (defun linum-highlight-current-line (line-number)
    "Highlight the current line number using `linum-current-line' face."
    (let ((face (if (= line-number linum-current-line)
                    'linum-current-line
                  'linum)))
      ;; (propertize (format ("%4d \u2502") line-number)
      (propertize (format (concat "%" linum-border-width "d \u2502") line-number)
                  'face face)))

  (setq linum-format 'linum-highlight-current-line)
  (global-linum-mode t)
  (define-key evil-normal-state-map (kbd "RET") 'newline-without-break-of-line-below)
  (define-key evil-normal-state-map (kbd "<S-return>") 'newline-without-break-of-line-above)
  (define-key evil-normal-state-map (kbd "ñ") 'hybrid-mode)
  (define-key evil-insert-state-map (kbd "C-y") 'yank)
  (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-insert-state-map (kbd "<C-dead-grave>") 'evil-escape)
  (define-key evil-hybrid-state-map (kbd "<C-dead-grave>") 'evil-escape)
  (define-key evil-replace-state-map (kbd "<C-dead-grave>") 'evil-escape)
  (define-key evil-surround-mode-map (kbd "<C-dead-grave>") 'evil-escape)

  ;; No yank in open files
  (add-hook 'spacemacs-buffer-mode-hook (lambda ()
                                          (set (make-local-variable 'mouse-1-click-follows-link) nil)))
  ;; Python 3
  ;; (setq py-python-command "/usr/bin/env python3")
  (setq python-shell-extra-pythonpaths (list "/usr/local/lib/python3.5/dist-packages/"))
  (setq flycheck-python-pylint-executable "python3")
  (require 'lsp-mode)
  (require 'lsp-ui)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)

  ;; Sistema de entrada de caracteres
  (prefer-coding-system 'utf-8)
  (set-language-environment 'utf-8)
  ;; --------------------------------------------------------

  ;; Romper lineas a un cierto número de caracteres
  (add-hook 'text-mode-hook 'turn-on-auto-fill)
  (setq-default fill-column 80)
  ;; Mostrar col 80 cars en python
  (add-hook 'python-mode-hook 'spacemacs/toggle-fill-column-indicator)

  ;; Abrir pdf con okular
  (defun ensc/mailcap-mime-data-filter (filter)
  ""
  (mapcar (lambda(major)
            (append (list (car major))
                    (remove nil
                            (mapcar (lambda(minor)
                                      (when (funcall filter (car major) (car minor) (cdr minor))
                                        minor))
                                    (cdr major)))))
          mailcap-mime-data))

(defun ensc/no-pdf-doc-view-filter (major minor spec)
  (if (and (string= major "application")
           (string= minor "pdf")
           (member '(viewer . doc-view-mode) spec))
      nil
    t))

(eval-after-load 'mailcap
  '(progn
     (setq mailcap-mime-data
           (ensc/mailcap-mime-data-filter 'ensc/no-pdf-doc-view-filter))))

;; Changes to Spaceline
(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
(set-face-attribute 'spaceline-evil-emacs nil :background "#63A600" :foreground "#151515")
(setq powerline-default-separator 'arrow)
(spaceline-toggle-minor-modes-off)
(spaceline-toggle-buffer-size-off)
(spaceline-toggle-line-column-off)
(spaceline-toggle-buffer-id-on)

;; Escape sequence delay
(setq-default evil-escape-delay 0.5)
;; Snippets
(setq yas-snippet-dirs
      '("~/.emacs.d/elpa/yasnippet-snippets-20180222.440/snippets/"
        "~/.emacs.d/private/snippets/"
        ))
;; --------------------------------------------------------
;; (add-to-list 'load-path "~/.emacs/own_pack/")
;; =dotspacemacs-configuration-layer-path= of your =~/.spacemacs=.
;; (dotspacemacs-configuration-layer-path)
;; (set dotspacemacs-configuration-layer-path ~/.emacs.d/own_pack/)
  ;; Problems with acutes
  (require 'iso-transl)
  ;; Configuración google translate
  (require 'google-translate)
  (require 'google-translate-smooth-ui)
  (setq google-translate-default-source-language "en")
  (setq google-translate-default-target-language "es")
  (setq google-translate-translation-directions-alist '(("en" . "es")))
  (setq google-translate-pop-up-buffer-set-focus t)
  ;; Default dict
  (setq-default ispell-dictionary "english")

  (setq split-height-threshold nil)
  (setq split-width-threshold 0)
  (require 'helm-bookmark)
  ;; Para ir al medio de la linea
  (defun middle-of-line ()
    "Put cursor at the middle point of the line."
    (interactive)
    (goto-char (/ (+ (point-at-bol) (point-at-eol)) 2)))

  (define-key evil-motion-state-map "gm" 'middle-of-line)
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-replace-with-register evil-nerd-commenter yasnippet-snippets yapfify xterm-color ws-butler winum which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package typit toc-org tagedit sudoku sql-indent spaceline smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters pyvenv pytest pyenv-mode py-yapf py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox pacmacs orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree multi-term move-text monokai-theme mmm-mode markdown-toc magit-gitflow macrostep lsp-ui lorem-ipsum livid-mode live-py-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag gscholar-bibtex google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-commentary evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emoji-cheat-sheet-plus emmet-mode elisp-slime-nav ein dumb-jump diminish define-word dactyl-mode cython-mode csv-mode company-web company-tern company-statistics company-emoji company-auctex company-anaconda column-enforce-mode color-identifiers-mode coffee-mode clean-aindent-mode auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell 2048-game))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))

