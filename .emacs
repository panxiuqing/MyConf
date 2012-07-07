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
(setq auto-save-default nil) ;��ֹ����#filename#�ļ�

;;������Ļ����
(setq scroll-step 1
      scroll-margin 5
      scroll-conservatively 10000) ;��������Ϊ1�����λ������5��λ��ʱ������Ļ

;;��ʾ�к�
(require 'linum)
(global-linum-mode t)

;;�Զ�����
(add-hook 'org-mode-hook
	  (lambda () (setq truncate-lines nil)))
;;��������ʾ�ļ�·��
(setq frame-title-format
      '("%S" (buffer-file-name "%f"
			       (dired-directory dired-directory "%d"))))

;;�����Զ���ȫ
(add-to-list 'load-path' "/usr/share/emacs/site-lisp/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/usr/share/emacs/site-lisp/auto-complete/ac-dict/")
(ac-config-default)

;;����Common Lisp����
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path' "/usr/share/emacs/site-lisp/slime/")
(require 'slime)
(slime-setup)

;;������ɫ����
;(add-to-list 'load-path' "/usr/share/emacs/site-lisp/color-theme/")
;(require 'color-theme)
;(color-theme-initialize)
;(load-file "~/.emacs.d/el-get/color-theme-mac-classic/color-theme-mac-classic.el")
;(color-theme-mac-classic)

;(load-file "~/.emacs.d/color-theme/color-theme-almost-monokai.el")
;(color-theme-almost-monokai)

(add-to-list 'load-path' "~/.emacs.d/jade-mode/")
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get") 
(unless 
    (require 'el-get nil t) 
  (with-current-buffer 
      (url-retrieve-synchronously "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))
(el-get 'sync)
    
;;��������
;(set-default-font "Monospace-10")

;;�Զ��ظ��ϴε�״̬
(desktop-save-mode 1)

(add-to-list 'load-path "~/.emacs.d/weibo.emacs/")
(require 'weibo)