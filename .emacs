
(setq x-select-enable-clipboard t)

;(setq stack-trace-on-error t)

(tool-bar-mode -1);去掉工具栏
(menu-bar-mode 0);隐藏菜单栏
(scroll-bar-mode 0);隐藏滚轮
(setq column-number-mode t);显示行列号
(setq line-number-mode t)
(desktop-save-mode 1) ;自动打开上次文件
;;(setq inhibit-startup-message t);关闭启动画面

(global-set-key (kbd "RET") 'newline-and-indent);自动缩进

;(define-key c++-mode-map (kbd ";") 'self-insert-command);取消分号自动缩进

;;最大化  
(defun my-maximized ()  
  (interactive)  
  (x-send-client-message  
    nil 0 nil "_NET_WM_STATE" 32  
    '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)  
  )  
  (x-send-client-message  
    nil 0 nil "_NET_WM_STATE" 32  
    '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0)  
  )  
)  
;;启动时最大化  
(my-maximized)  

;;C/C++  mode
;;(defun my-c-mode-auto-pair ()
;;  (interactive)
;;  (make-local-variable 'skeleton-pair-alist)
;;  (setq skeleton-pair-alist  '(
;;    (?{ \n > _ \n ?} >)))
;;  (setq skeleton-pair t)
;;  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
;;  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
;;  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
;;  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)   
;;  (backward-char))
;;(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
;;(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)

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

;;颜色配置
(add-to-list 'load-path "~/.emacs.d/")
(require 'color-theme)
(color-theme-initialize)
(color-theme-taylor)

;;快速设置字体大小（CTRL+用滚轮）
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

;;w3m配制
(add-to-list 'load-path "~/emacs-w3m/")
(require 'w3m-load)
(require 'mime-w3m)
(autoload 'w3m "w3m" "interface for w3m on emacs" t) 

;; 设置w3m主页
(setq w3m-home-page "http://www.baidu.com")

;; 默认显示图片
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)

;; 使用cookies
(setq w3m-use-cookies t)

;;设定w3m运行的参数，分别为使用cookie和使用框架  
(setq w3m-command-arguments '("-cookie" "-F"))               

;; 使用w3m作为默认浏览器
(setq browse-url-browser-function 'w3m-browse-url)                
(setq w3m-view-this-url-new-session-in-background t)


;;显示图标                                                      
(setq w3m-show-graphic-icons-in-header-line t)                  
(setq w3m-show-graphic-icons-in-mode-line t) 

;;C-c C-p 打开，这个好用                                        
(setq w3m-view-this-url-new-session-in-background t)  
          
(add-hook 'w3m-fontify-after-hook 'remove-w3m-output-garbages)                                    
(defun remove-w3m-output-garbages ()                            
"去掉w3m输出的垃圾."                                            
(interactive)                                                   
(let ((buffer-read-only))                                       
(setf (point) (point-min))                                      
(while (re-search-forward "[\200-\240]" nil t)                  
(replace-match " "))                                            
(set-buffer-multibyte t))                                       
(set-buffer-modified-p nil))

;;stardict星际译王
;;要安装 stardict 和 sdcv (直接sudo apt-get )
(require 'stardict)
(global-set-key (kbd "C-c C-i") 'view-stardict-in-buffer)


;;markdown-mode
(add-to-list 'load-path "~/.emacs.d/modes")
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))