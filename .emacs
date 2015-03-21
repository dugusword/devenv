;; .emacs


(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;;theme
(load-theme 'monokai t)

;; disable toolbar
(tool-bar-mode -1)

;; disable startup screen
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))

;; use c++ mode open header file
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; always use space, default ident 4 chars
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)

;; display line/column
(setq line-number-mode t)
(setq column-number-mode t)
(set-face-attribute 'default nil :height 100)
