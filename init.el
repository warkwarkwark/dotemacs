;; Free up screen real estate
(scroll-bar-mode -1)
(menu-bar-mode -1)

;;Set up the customize file to its own separate file, instead of saving customize settings in init.el.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file :noerror) ; don't care if this exists

;;; Set up package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
        '((org-plus-contrib . "org"))))
(package-initialize)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; `diminish' is optional now
(unless (package-installed-p 'diminish)
  (package-refresh-contents)
  (package-install 'diminish))

;; From use-package README
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)

;;; Load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))
