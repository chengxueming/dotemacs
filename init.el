  (setq package-archives
        '(("melpa" . "https://melpa.org/packages/")) )
  (package-initialize)
  (unless (package-installed-p 'ac-php )
    (package-refresh-contents)
    (package-install 'ac-php )
    )
  (require 'cl)
  (require 'php-mode)
  (add-hook 'php-mode-hook
            '(lambda ()
               (auto-complete-mode t)
               (require 'ac-php)
               (setq ac-sources  '(ac-source-php ) )
               (yas-global-mode 1)
               (ac-php-core-eldoc-setup ) ;; enable eldoc

               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back)    ;go back
               ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-linum-mode t)
 '(package-selected-packages (quote (flymake-php ac-php))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq cxm-startup-dir (file-name-directory load-file-name)
      cxm-config-dir (expand-file-name "config" cxm-startup-dir)
      cxm-site-lisp-dir (expand-file-name "site-lisp" cxm-startup-dir))
      
(message load-file-name)
(add-to-list 'load-path cxm-config-dir)

(set-default-font "-*-Ayuthaya-normal-normal-normal-*-14-*-*-*-p-0-iso10646-1")
(define-key global-map [C-@] 'set-mark-command)

;;; recently opened file
(require 'recentf)
(setq recentf-max-saved-items 100)
(recentf-mode 1)
(put 'upcase-region 'disabled nil)
