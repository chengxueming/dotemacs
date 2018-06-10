(require 'subr-x)

(defun pointc(point)
  "获得光标处的字符"
  (buffer-substring-no-properties point (+ 1 point))
  )

(defun points()
  "获得光标所在的‘’"
  (setq start (point))
  (setq end start)
  (while (not (string-equal (pointc start) "'"))
    (setq start (- start 1))
    )
  (setq start (1+ start))
  (while (not (string-equal (pointc end) "'"))
    (setq end (+ end 1))
    )
  (setq cursor-string (buffer-substring-no-properties start end))
  )

(defun join-list (l)
  "join a list to string like php func 'implode'"
  (setq res "")
  (dolist (var l)
    (setq res (concat res var))
    )
  res
  )
(provide '99-comhelp)
