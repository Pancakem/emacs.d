;; see http://emacs.1067599.n8.nabble.com/use-package-tp396907p397337.html
;; we need it for the function 'case' in the 'by-backend' macro
(require 'cl-lib)

;; taking ideas from https://github.com/jkitchin/scimax
;;
(defconst my-emacs-dir (file-name-directory (or load-file-name (buffer-file-name)))
  "Directory where my-emacs is installed.")

(defvar my-emacs-personal-dir (expand-file-name "personal" my-emacs-dir)
  "Personal directory for personal code.")

(setq user-emacs-directory my-emacs-dir)

(setq package-user-dir (expand-file-name "elpa"  my-emacs-dir))

;; Initialize the emacs packaging system
(require 'package)

(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (and (package-installed-p 'use-package)
	     (package-installed-p 'org-plus-contrib))
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'org-plus-contrib))

(org-babel-load-file  (expand-file-name "config.org" my-emacs-dir))
