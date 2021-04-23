(setq user-full-name "bgallois"
      user-mail-address "benjamin@gallois.cc")

(setq doom-font (font-spec :family "roboto mono" :size 14))

(setq doom-theme 'doom-oceanic-next)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

(setq evil-escape-key-sequence "ii")

(setq confirm-kill-emacs nil)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
