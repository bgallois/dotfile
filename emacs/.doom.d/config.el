(setq user-full-name "bgallois"
      user-mail-address "benjamin@gallois.cc")

(setq doom-font (font-spec :family "roboto mono" :size 14))

(setq doom-theme 'doom-oceanic-next)

(setq org-directory "~/org/")

(setq display-line-numbers-type t)

(setq evil-escape-key-sequence "ii")

(setq confirm-kill-emacs nil)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(setq centaur-tabs-set-bar 'over
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer
      centaur-tabs-height 24
      centaur-tabs-set-modified-marker t
      centaur-tabs-style "bar"
      centaur-tabs-modified-marker "•")
(map! :leader
      :desc "Toggle tabs globally" "t c" #'centaur-tabs-mode
      :desc "Toggle tabs local display" "t C" #'centaur-tabs-local-mode)
(evil-define-key 'normal centaur-tabs-mode-map (kbd "g <right>") 'centaur-tabs-forward        ; default Doom binding is 'g t'
                                               (kbd "g <left>")  'centaur-tabs-backward       ; default Doom binding is 'g T'
                                               (kbd "g <down>")  'centaur-tabs-forward-group
                                               (kbd "g <up>")    'centaur-tabs-backward-group)
