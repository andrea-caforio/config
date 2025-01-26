(use-package emacs
  :config
  (set-frame-font "Source Code Pro Semibold 12" nil t)
  (setq make-backup-files nil)
  (setq create-lockfiles nil)
  (setq use-short-answers t)
  (global-auto-revert-mode)
  (setq auto-revert-check-vc-info t)
  (setq-default indent-tabs-mode nil)
  (delete-selection-mode 1)
  (setq split-width-threshold 200)
  (setq-default cursor-type 'bar)
  (global-hl-line-mode)
  :hook
  (prog-mode . column-number-mode)
  (prog-mode . display-line-numbers-mode)
  (before-save . whitespace-cleanup))

(load-file ".config/emacs/elpaca.el")

(use-package exec-path-from-shell
  :ensure (:repo "https://github.com/purcell/exec-path-from-shell")
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package ef-themes
  :ensure (:repo "https://github.com/protesilaos/ef-themes"))
(use-package modus-themes
  :ensure (:repo "https://github.com/protesilaos/modus-themes")
  :config (load-theme 'modus-vivendi t))

(use-package transient
  :ensure (:repo "https://github.com/magit/transient"))
(use-package magit
  :ensure (:repo "https://github.com/magit/magit")
  :config (setq magit-auto-revert-mode t))

(use-package vertico
  :ensure (:repo "https://github.com/minad/vertico")
  :init (vertico-mode))
(use-package consult
  :ensure (:repo "https://github.com/minad/consult"))
(use-package marginalia
  :ensure (:repo "https://github.com/minad/marginalia")
  :init (marginalia-mode))
(use-package orderless
  :ensure (:repo "https://github.com/oantolin/orderless")
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package doom-modeline
  :ensure (:repo "https://github.com/seagle0128/doom-modeline")
  :init (doom-modeline-mode t)
  :config (setq doom-modeline-vcs-max-length 45))

(use-package projectile
  :ensure (:repo "https://github.com/bbatsov/projectile")
  :config
  (projectile-mode +1)
  (add-to-list 'projectile-globally-ignored-directories "build")
  (add-to-list 'projectile-globally-ignored-directories "bazel*")
  (add-to-list 'projectile-globally-ignored-directories ".worktree")
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package verilog-mode
  :ensure nil
  :hook
  (verilog-mode . (lambda () (setq fill-column 100)))
  (verilog-mode . display-fill-column-indicator-mode)
  :config
  (setq verilog-indent-level 2
        verilog-indent-level-directive 0
        verilog-indent-level-module 2
        verilog-indent-level-behavioral 2
        verilog-indent-level-declaration 2
        verilog-auto-newline nil
        verilog-auto-endcomments nil))

(use-package highlight-indent-guides
  :ensure (:repo "https://github.com/DarthFennec/highlight-indent-guides")
  :config
  (setq highlight-indent-guides-method 'bitmap)
  (setq highlight-indent-guides-auto-enabled nil)
  (set-face-background 'highlight-indent-guides-odd-face "darkgray")
  (set-face-background 'highlight-indent-guides-even-face "dimgray")
  (set-face-foreground 'highlight-indent-guides-character-face "dimgray")
  :hook (prog-mode . highlight-indent-guides-mode))
