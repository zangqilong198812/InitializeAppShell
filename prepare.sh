#!/bin/bash
#Program:
#	This shell  will help you install basic environment
#

if ! type "brew" > /dev/null; then
	echo "你还没有安装homebrew,将要开始安装brew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "已经安装homebrew"
fi

echo 安装homebrew
if ! type "brew" > /dev/null; then
	echo "你还没有安装homebrew,将要开始安装brew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "已经安装homebrew"
fi

echo 安装clang-format
if ! type "clang-format" > /dev/null; then

	echo "正在安装clang-format"
	brew install clang-format
	echo "正在下载clang style 文件"
	curl https://gist.githubusercontent.com/zangqilong198812/66331d5325cd2fb2d3e3015f97fb030a/raw/182884cecd0db7508a6c50b3d4ba2e62ea52139c/gistfile1.txt > ../.clang-format

else
	echo "已经安装clang-format"
fi

echo "是否在每次提交commit的时候自动规范代码？[Y/N]:"
read autoStandardCodeStyle

if [ "$autoStandardCodeStyle" == "Y" ] || [ "$autoStandardCodeStyle" == "y" ]; then
	echo "下载pre-commit文件"
	curl https://gist.githubusercontent.com/zangqilong198812/20075e94ee2a070060465d1f9bb68ae6/raw/97ef6efa45de51d76697ae1de404493dfdc99d9d/gistfile1.txt > ../.git/hooks/pre-commit
	chmod a+x ../.git/hooks/pre-commit
fi

echo "是否增加gitattributes规则防止pbxproj conflict?[Y/N]:"
read autoAvoidConflict
if [ "$autoAvoidConflict" == "Y" ] || [ "$autoAvoidConflict" == "y" ]; then

	echo "设置gitattributes"
	echo "*.pbxproj merge=union" > ../.gitattributes
fi

echo "是否安装git flow命令行？[Y/N]:"
read isAddGitFlow
if [  "$isAddGitFlow" == "Y" ] || [ "$isAddGitFlow" == "y" ]; then
	echo "安装git flow"
	if brew ls --versions git-flow-avh > /dev/null; then
		echo "已经安装git flow"
	else 
		echo "将要安装git flow"
		brew install git-flow-avh
	fi
fi





