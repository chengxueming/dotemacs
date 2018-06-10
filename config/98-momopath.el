;; 尝试定义一个宏可以通过命令跳转到goback目录，model目录，bash目录
(defmacro momo-goto (path func)
  (list 'defun (intern func) (list ) (list 'interactive) (list 'dired path)))

;; php实验室
(momo-goto "~/.emacs.d/site-lisp/" "go-site-el")
;; php实验室
(momo-goto "~/Desktop/php-lab/php-lab/" "go-lab")
;; 工作目录
(momo-goto "~/Desktop/workspace/" "go-workspace")
;; github目录
(momo-goto "~/Desktop/github/" "go-hub")
;; 测试目录
(momo-goto "~/Desktop/workspace/momo-package/" "go-my-momocode")
;; code_base base 目录
(momo-goto "~/Desktop/workspace/php-web/code_base/base/" "go-base-base")
;; code_base 反spam
(momo-goto "~/Desktop/workspace/php-web/code_base/base/antispam/manager/" "go-base-antispam-manager")
;; web 的 model
(momo-goto "~/Desktop/workspace/php-web/web/php/newapp/models/" "go-newapp-model")
;; web 的 goback
(momo-goto "~/Desktop/workspace/php-web/web/php/app/controller/async/moirai/" "go-async-moirai")
;; web 的 controller
(momo-goto "/Users/momo/Desktop/workspace/php-web/web/php/newapp/controllers/moirai/" "go-newapp-moirai")
;; web 的 页面
(momo-goto "~/Desktop/workspace/php-web/web/php/app/view/template/admin/web2/" "go-app-view")
;; web 的 定时任务
(momo-goto "~/Desktop/workspace/php-web/web/php/app/controller/task/" "go-web-miss")
;; api-moa 的控制器
(momo-goto "~/Desktop/workspace/php-web/api-moa/app/controller/v1/" "go-php-moa")

(defun jump-goback ()
  (interactive)
  (setq url (points))
  (setq methods (cddr (split-string url "/")))
  (ac-php-location-stack-push)
  (let ((file (concat goback-dir (nth 0 methods) "_" "controller.php")) (method (nth 1 methods)))
    (find-file file)
    (goto-char 0)
    (search-forward method))
  )
