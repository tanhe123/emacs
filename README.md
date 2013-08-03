新增更新
----------------------------
2013.08.03
> 1.新增markdown-mode  

2013.7.31
> 1.更改默认主题  
> 2.增加快速字体缩放(按住CTRL+滑轮)  

> 3.新增w3m浏览网页  
>> 说明如果出现不能打开w3m-load，要安装w3m, 具体操作如下:  
>>> 安装 w3m-el-snapshot  
>>>> sudo apt-get install w3m-el-snapshot

>>> 安装emacs-w3m  
>>>> cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot login  
>>>> cvs -d :pserver:anonymous@cvs.namazu.org:/storage/cvsroot co emacs-w3m  
>>>> cd emacs-w3m  
>>>> autoconf  
>>>> ./configure  
>>>> sudo make  
>>>> sudo make install  

> 4.stardict 查词  
>> 如果 emacs提示 /bin/bash: sdcv: 未找到命令，说明未安装stardict 和 sdcv  
>> sudo apt-get install stardict （自己加词库）  
>> sudo apt-get install sdcv  


##边看题边敲代码（ACM）
图：  
![acming](acming.png)

c/c++插件
---------------------------------------------------------
cedet是根据 http://emacser.com/cedet.htm 设置的。  
一起那用 auto-complete + clang 感觉好卡，就全卸了，用的 CVS 版的 edet.  
edet的安装 http://emcser.com/install-cedet.htm  

##针对补全的2个截图
图一：
![图1](1.png)


图二：
![图2](2.png)


##安装方法
		安装好 emacs 然后将代码仓库的
		.emacs.d/ 放在～/
		.emacs 放在 ~/
		安装好 g++ 便可以直接使用了。

使用技巧
------------------
##补全
		1.M-n 弹出补全菜单（C-n C-p 可以上下选择)
##跳转
		1.F12 跳到函数定义
		2.M-S-F12 跳到函数声明去，在声明处再执行的话就会再跳回函数
		3.S-F12 跳会初始位置
