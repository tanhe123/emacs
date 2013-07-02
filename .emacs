
(setq x-select-enable-clipboard t)

;(setq stack-trace-on-error t)

(tool-bar-mode -1);去掉工具栏 
(setq column-number-mode t);显示行列号
(setq line-number-mode t)
;;(desktop-save-mode 1) ;自动打开上次文件
;;(setq inhibit-startup-message t);关闭启动画面

(global-set-key (kbd "RET") 'newline-and-indent);自动缩进

;(define-key c++-mode-map (kbd ";") 'self-insert-command);取消分号自动缩进

;;C/C++  mode
;(defun my-c-mode-auto-pair ()
;  (interactive)
;  (make-local-variable 'skeleton-pair-alist)
;  (setq skeleton-pair-alist  '(
;    (?{ \n > _ \n ?} >)))
;  (setq skeleton-pair t)
;  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)   
;  (backward-char))
;(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
;(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)

(defun my-c-mode-set ()
  (c-set-style "k&r")
  (hs-minor-mode t)
;;在状态条上显示当前光标在哪个函数体内部
  (which-function-mode)
;; 设置C/C++语言缩进字符数
  (setq c-basic-offset 4))


(add-hook 'c-mode-hook 'my-c-mode-set)
(add-hook 'c++-mode-hook 'my-c-mode-set)


;;cedet配置
(add-to-list 'load-path "/home/tan/.emacs.d/plugins/cedet/common")
(require 'cedet)
(require 'semantic-ia)
 
;; Enable EDE (Project Management) features
(global-ede-mode 1)
 
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
 
;; Enable SRecode (Template management) minor-mode.
(global-srecode-minor-mode 1)

;;semantc
;; (semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
;;(defconst cedet-win32-include-dirs
;;  (list "C:/MinGW/include"
;;        "C:/MinGW/include/c++/3.4.5"
;;        "C:/MinGW/include/c++/3.4.5/mingw32"
;;        "C:/MinGW/include/c++/3.4.5/backward"
;;        "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
;;        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;;semantic-ia-fast-jump 跳转到函数的定义 绑定到f12
(global-set-key [f12] 'semantic-ia-fast-jump)
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;;跳到函数声明去，在声明处再执行的话就会再跳回函数体，把它绑定到M-S-F12
(define-key c-mode-base-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)
;;补全
(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)

;;编译
(define-key c-mode-base-map [(f7)] 'compile)
'(compile-command "make")
