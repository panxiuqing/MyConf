;;use emacs with scheme
(global-font-lock-mode 1)

(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

(setq scheme-program-name "mzscheme")

;;autocomplete commond
(icomplete-mode 1)
(define-key minibuffer-local-completion-map (kbd "SPC") 'minibuffer-complete-word)

;;set frame size
(if (window-system)
    (set-frame-width (selected-frame) 80)) 

(setq-default line-spacing 0)

;;turn off the startup message
(setq inhibit-startup-message t)

;;turn off tool-bar menu-bar and scroll-bar
(tool-bar-mode nil)
(menu-bar-mode nil) 
(scroll-bar-mode nil)

;;set f4 to list opened buffer
(require 'ibuffer)
(global-set-key [(f4)] 'ibuffer)

;;display time and row number
(display-time-mode t)
(column-number-mode t)

(setq backup-inhibited t)
(setq auto-save-default nil) ;阻止产生#filename#文件

;;设置屏幕滚动
(setq scroll-step 1
      scroll-margin 5
      scroll-conservatively 10000) ;滚动步长为1，光标位于上下5行位置时滚动屏幕

;;显示行号
(require 'linum)
(global-linum-mode t)

;;自动折行
(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))

;;标题栏显示文件路径
(setq frame-title-format
      '("%S" (buffer-file-name "%f"
			       (dired-directory dired-directory "%d"))))

;;设置自动补全
(add-to-list 'load-path' "/usr/share/emacs/site-lisp/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/usr/share/emacs/site-lisp/auto-complete/ac-dict/")
(ac-config-default)

;;设置Common Lisp环境
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path' "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup)

;;设置颜色主题
;(add-to-list 'load-path' "/usr/share/emacs/site-lisp/color-theme/")
(require 'color-theme)
(color-theme-initialize)
;(load-file "~/.emacs.d/el-get/color-theme-mac-classic/color-theme-mac-classic.el")
;(color-theme-mac-classic)
;(color-theme-aalto-light)
(load-file "~/.emacs.d/color-theme/color-theme-almost-monokai.el")
(color-theme-almost-monokai)

(add-to-list 'load-path' "~/.emacs.d/jade-mode/")
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(add-to-list 'load-path
	     "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get") 
(unless 
    (require 'el-get nil t) 
  (with-current-buffer 
      (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))
(el-get 'sync)

;;设置字体
(set-frame-font "monaco-11")

;;自动回复上次的状态
(desktop-save-mode 1)

(add-to-list 'load-path "~/.emacs.d/weibo.emacs/")
(require 'weibo)

;;Some copy functions
(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line"
  (interactive "P")
  (let ((beg (line-beginning-position)) 
	(end (line-end-position arg)))
    (copy-region-as-kill beg end))
  )

(defun copy-word (&optional arg)
  "Copy words at point"
  (interactive "P")
  (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point))) 
	(end (progn (forward-word arg) (point))))
    (copy-region-as-kill beg end))
  )


(defun copy-paragraph (&optional arg)
  "Copy paragraphes at point"
  (interactive "P")
  (let ((beg (progn (backward-paragraph 1) (point))) 
	(end (progn (forward-paragraph arg) (point))))
    (copy-region-as-kill beg end))
  )