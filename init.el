


(require 'package)

(add-to-list 'package-archives
       '("popkit" . "http://elpa.popkit.org/packages/") t)

;;YASNippet
;;---------------------------------------------
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)
;;----------------------------------------------

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    ein
    elpy
    flycheck
    material-theme
    ;;yasnippet
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)



;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally

;;CUSTOMIZATION FOR ORG_MODE
;;......................................
(setq org-hide-leading-stars t)
 (define-key global-map "\C-ca" 'org-agenda)
 (setq org-log-done 'time)

;; PYTHON CONFIGURATION
;; --------------------------------------

(elpy-enable)


;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;; init.el ends here

(defface hi-red-b '((t (:foreground "#e50062"))) t)
(defun org-bold-highlight () 
  (interactive)
  (hi-lock-mode)
  (highlight-regexp "[ \\t]\\(\\*\\(\\S-[^*]+\\S-\\|[^*]\\{1,2\\}\\)\\*\\)[ \\t\\n]*" 'hi-red-b)) (add-hook 'org-mode-hook 'org-bold-highlight)


;;slime
;;-------------------------
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))




;;auto-complete config
;;------------------------------------------
(add-to-list 'load-path "~/.emacs.d/plugins/pos-tip")
(add-to-list 'load-path "~/.emacs.d/plugins/fuzzy-el")
(add-to-list 'load-path "~/.emacs.d/plugins/popup-el")
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")



(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories
             "~/.emacs.d/plugins/auto-complete/dict")
(ac-config-default)


(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)   ;default is t

(setq ac-use-quick-help t)
(setq ac-quick-help-delay 1.0)

(setq ac-dwim t)


(setq ac-trigger-commands
      (cons 'backward-delete-char-untabify ac-trigger-commands))

(setq ac-fuzzy-enable t)


;;ac-slime
;;--------------------------------------
(require 'ac-slime)
 (add-hook 'slime-mode-hook 'set-up-slime-ac)
 (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
 (eval-after-load "auto-complete"
   '(add-to-list 'ac-modes 'slime-repl-mode))


;;themes
;;--------------------------------------
(load-theme 'monokai t)





