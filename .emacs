;; .emacs


(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

; list the packages you want
(setq package-list '(monokai-theme company rust-mode dockerfile-mode markdown-mode))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; auto-complete
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;;(ac-config-default)
(add-hook 'after-init-hook 'global-company-mode)

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
 '(package-selected-packages
   (quote
    (markdown-mode dockerfile-mode rust-mode company monokai-theme)))
 '(tool-bar-mode nil))

;; use c++ mode open header file
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; always use space, default ident 4 chars
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq-default c-basic-offset 4)
(c-set-offset 'substatement-open 0)
(c-set-offset 'innamespace 0)
(c-set-offset 'inextern-lang 0)

;; display line/column
(setq line-number-mode t)
(setq column-number-mode t)
(set-face-attribute 'default nil :height 100)
'(company-global-modes '(not gud-mode))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when window-system (set-frame-size (selected-frame) 80 60))
