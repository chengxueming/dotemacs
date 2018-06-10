(require '99-comhelp)
(defun addSlash (start end)
  "给选中的区域\"转义"
  (interactive "r") ;可以在选中区域提取开头结尾位置
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min));; 遍历选中去并依此替换，即时生效
    (while (search-forward "\"" nil t) (replace-match "\\\"" nil t))
    ))


(defun json-to-php(start end)
  "将json转换为php数组代码"
  (interactive "r") 
  (save-restriction
    (narrow-to-region start end)
    (goto-char (point-min))
    (while (search-forward "{" nil t) (replace-match "[" nil t))
    (goto-char (point-min))
    (while (search-forward "}" nil t) (replace-match "]" nil t))
    (goto-char (point-min))
    (while (search-forward ":" nil t) (replace-match "=>" nil t))
    ))

(defun param-to-array(start end)
  "将参数列表转换为数组"
  ;; input $a, $bb, $cccc
  ;; output
  ;;    "a"     => $a,
  ;;    "bb"    => $bb,
  ;;    "cccc"  => $cccc
  (interactive "r")
  (setq colls (list))
  (setq max-padding 0)
  (let ((str (buffer-substring-no-properties start end)))
    (setq eles (split-string str ", "))
    (dolist (ele eles)
      (let ((var (substring ele 1)))
	(setq sub-ele (list (concat "    \"" var  "\" " ) (concat " => " ele)))
	(if (> (length (nth 0 sub-ele)) max-padding)
	    (setq max-padding (length (nth 0 sub-ele))))
	(setq colls (append colls (list sub-ele)))
	)))
  (setq new-colls (param-to-array-padding-first colls max-padding))
  (message (string-join new-colls ",\n")))

(defun param-to-array-padding-first (colls max-padding)
  ;;将列表中每个元素第一个子元素用空格补全 
  ;;(setq param (list (list "\"a\"" "=> $b") (list "\"aa\"" "=> $b"))
  ;;(param-to-array-padding-first param 3)
  (setq new-colls (list))
  (dolist (ele colls)
    (setq pre (nth 0 ele))
    (if (< (length pre) max-padding)
	(progn
	  (setq padding (make-string (- max-padding (length pre)) ? ))
	  (setq new-pre (concat pre padding))
	  (setcar (nthcdr 0 ele) new-pre))
      )
    (setq new-colls (append new-colls (list (join-list ele))))
    )
  new-colls
  )
