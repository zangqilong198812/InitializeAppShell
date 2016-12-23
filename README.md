# 常用工具一键安装

## 使用方法  

`git clone git@github.com:zangqilong198812/InitializeAppShell.git`  

`cd InitializeAppShell`  

`sh prepare.sh`  

即可运行。

运行界面如下。
![](http://ww1.sinaimg.cn/large/006tNc79jw1fb0r8le8taj30lk0d641h.jpg)

## 介绍  
1. homebrew 最常用的mac包管理器， [官网](http://brew.sh/)  
2. git flow 最常用的代码版本管理流程，[git flow 介绍](http://danielkummer.github.io/git-flow-cheatsheet/index.zh_CN.html)
3. chisel FB出品的lldb加强工具 [github地址](https://github.com/facebook/chisel)
4. 更改gem source源（众所周知的原因） [源介绍](https://ruby.taobao.org/)
5. oh-my-zsh 超强的shell [github地址](https://github.com/robbyrussell/oh-my-zsh)
6. cocoapods 这个不用介绍了吧
7. carthage 同上
8. clang-format 一个格式化代码的命令行工具 [文档介绍](http://clang.llvm.org/docs/ClangFormat.html)
9. clang-format的格式文件，比如你希望拥有什么样的格式 [说明](www.clangformat.com)
10. 一种避免iOS项目merge时候的pbxproj冲突的方法 [介绍](http://roadfiresoftware.com/2015/09/automatically-resolving-git-merge-conflicts-in-xcodes-project-pbxproj/)
11. 往项目的`.git/hooks`文件夹添加一个pre-commit文件，用来在用户git commit之后做代码的格式化 [git hook介绍](https://git-scm.com/book/zh/v2/%E8%87%AA%E5%AE%9A%E4%B9%89-Git-Git-%E9%92%A9%E5%AD%90)
12. Objective-C项目的ignore文件
13. Swift项目的ignore文件
  
## 卸载  
只需要删除根目录下的`.git/hooks/pre-commit`即可。


