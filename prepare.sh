#!/bin/bash
#Program:
#	This shell  will help you install basic environment
#






showMenu() {
	echo "================================================================="
	echo "选择需要安装的功能"
	echo "1. 安装homebrew"
	echo "2. 安装clang-format"
	echo "3. 添加gitattributes防止pbxproj conflict"
	echo "4. 安装gitflow"
	echo "5. 安装commit hook自动规范代码（需要先安装clang-format并且确保你的根目录有.git文件夹）"
	echo "6. 安装chisel"
	echo "7. 更改gem source源到ruby-china"
	echo "8. 安装oh-my-zsh"
	echo "9. 安装Cocoapods"
	echo "10. 安装carthage"
	echo "================================================================="
	read -p "输入编号：" number

	case $number in 
		1) installbrew
		;;
		2) installClangformat
		;;
		3) installGitattributes
		;;
		4) installGitflow
		;;
		5) installCommithook
		;;
		6) installChisel
		;;
		7) installGemSource
		;; 
		8) installOhMyZsh
		;;
		9) installCocoapods
		;;
		10) installCarthage
		;;
	esac
}

installbrew() {
	if ! type "brew" > /dev/null; then
		echo "将要开始安装brew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "已经安装homebrew"
	fi
}

installClangformat() {
	echo 安装clang-format
	if ! type "clang-format" > /dev/null; then

		echo "正在安装clang-format"
		brew install clang-format
		echo "正在下载clang style 文件"
		curl https://gist.githubusercontent.com/zangqilong198812/66331d5325cd2fb2d3e3015f97fb030a/raw/182884cecd0db7508a6c50b3d4ba2e62ea52139c/gistfile1.txt > ../.clang-format

	else
		echo "已经安装clang-format"
	fi
}

installCommithook() {
	echo "下载pre-commit文件"
	curl https://gist.githubusercontent.com/zangqilong198812/20075e94ee2a070060465d1f9bb68ae6/raw/97ef6efa45de51d76697ae1de404493dfdc99d9d/gistfile1.txt > ../.git/hooks/pre-commit
	chmod a+x ../.git/hooks/pre-commit
}

installGitattributes() {
	
	echo "设置gitattributes"
	echo "*.pbxproj merge=union" > ../.gitattributes
}


installGitflow() {

	echo "安装git flow"
	if brew ls --versions git-flow-avh > /dev/null; then
		echo "已经安装git flow"
			else 
		echo "将要安装git flow"
		brew install git-flow-avh
	fi
}

installChisel() {
	brew update
	brew install chisel
	echo "command script import /path/to/fblldb.py" > ~/.lldbinit
}

installGemSource() {
	gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
	gem sources -l
}

installOhMyZsh() {
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

installCocoapods() {
	sudo gem install cocoapods
}

installCarthage() {
	brew update
	brew install carthage
}

####################################################
showMenu





