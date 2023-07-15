;; this is my ~/.emacs.d/init.el

;; straight initialization
(defvar bootstrap-version)
(let ((bootstrap-file
      (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)

;; (setq use-package-always-defer t)
(setq use-package-verbose t)
(setq use-package-minimum-reported-time 0.00001)

;; Configure use-package to use straight.el by default
(use-package straight
  :custom
  (straight-use-package-by-default t))

;; définition de l'emplacement de certains fichiers
(use-package no-littering
  :config
  (setq custom-file (no-littering-expand-var-file-name "custom.el")))

;; default org-mode
(use-package org :straight (:type built-in))

;; load les variables customiser (chemin définit par no-littering)
;; (org-babel-load-file (expand-file-name "~/.emacs.d/var/custom.el"))
(when (file-exists-p custom-file)
  (load custom-file nil 'nomessage))

;; gnus-home-directory, faut le charger avant le reste à cause de org-babel-load-file
(setq gnus-home-directory (no-littering-expand-var-file-name "gnus/"))

;; launch emacs config
(org-babel-load-file (expand-file-name "~/.emacs.d/config/config.org"))
