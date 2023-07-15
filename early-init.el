;; éviter "Package cl is deprecated"
(setq byte-compile-warnings '(cl-functions))

;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)

;; prevent resize window on startup and boost a little speed
(setq frame-inhibit-implied-resize t)

;; Contrary to what many Emacs users have in their configs, you don't need
;; more than this to make UTF-8 the default coding system:
(set-language-environment "UTF-8")

;; set-language-enviornment sets default-input-method, which is unwanted
(setq default-input-method nil)
