cedet是根据 http://emacser.com/cedet.htm 设置的。
一起那用 auto-complete + clang 感觉好卡，就全卸了，用的 CVS 版的 edet.
edet的安装 http://emacser.com/install-cedet.htm

##针对补全的3个截图
![图1](1.png)
>
![图2](2.png)
>
![图3](3.png)

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
