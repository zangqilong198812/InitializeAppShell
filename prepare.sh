#!/bin/bash
#Program:
#	This shell  will help you install basic environment
#
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

else
	echo "已经安装clang-format"
fi

echo "正在下载clang style 文件"
curl https://gist.githubusercontent.com/zangqilong198812/66331d5325cd2fb2d3e3015f97fb030a/raw/182884cecd0db7508a6c50b3d4ba2e62ea52139c/gistfile1.txt > ../.clang-format

echo "安装git flow"
if brew ls --versions git-flow-avh > /dev/null; then
	echo "已经安装git flow"
else 
	echo "将要安装git flow"
	brew install git-flow-avh
fi

echo "安装Git hook"
if [ -d "../.git/hooks" ]; then
	echo "检测到hooks文件夹"
else
	mkdir ../.git/hooks
fi

echo "下载pre-commit文件"
curl https://gist.githubusercontent.com/zangqilong198812/20075e94ee2a070060465d1f9bb68ae6/raw/e42cc8a9a7eb86f29ab423fb4b2fb516b50c3a71/gistfile1.txt > ../.git/hooks/pre-commit
chmod a+x ../.git/hooks/pre-commit

