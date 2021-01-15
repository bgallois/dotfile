(setq user-full-name "bgallois"
      user-mail-address "benjamin@gallois.cc")

(setq doom-font (font-spec :family "firacode" :size 15))

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

(setq evil-escape-key-sequence "ii")

(setq confirm-kill-emacs nil)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
