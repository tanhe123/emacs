新增更新
----------------------------
2013.7.31
> 1.更改默认主题</br>
> 2.增加快速字体缩放(按住CTRL+滑轮)</br>
> 3.新增w3m浏览网页</br>
说明(需要)：</br>
sudo apt-get install w3m-el-snapshot</br>

http://blog.chinaunix.net/uid-26185912-id-3248452.html</br>
安装emacs-w3m</br>

> 4.stardict 查词</br>
sudo apt-get install stardict （自己加词库）</br>
sudo apt-get install sdcv</br>



c/c++插件
---------------------------------------------------------
cedet是根据 http://emacser.com/cedet.htm 设置的。</br>
一起那用 auto-complete + clang 感觉好卡，就全卸了，用的 CVS 版的 edet.</br>
edet的安装 http://emcser.com/install-cedet.htm</br>



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
