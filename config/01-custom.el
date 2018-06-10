(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ))
(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

;; all backups goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backups"))))
;; 阻止生成自动备份文件(.#file)
(setq auto-save-default nil)
;; php xdebug
;; (add-to-list 'load-path (expand-file-name "geben" cxm-site-lisp-dir))
;; (require 'geben)
;; expand region
(add-to-list 'load-path (expand-file-name "expand-region.el" cxm-site-lisp-dir))
(require 'expand-region)
(global-set-key (kbd "C-=")
		'er/expand-region)
(global-set-key (kbd "C--")
		'er/contract-region)
;; rainbow-delimiters
(add-to-list 'load-path (expand-file-name "rainbow-delimiters" cxm-site-lisp-dir))
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
