#!/bin/bash
#Program:
#	This shell  will help you install basic environment
#






showMenu() {
	echo "================================================================="
	echo "选择需要安装的功能"
	echo "1. 安装homebrew"
	echo "2. 安装gitflow  （一个简化git flow流程的命令行工具）"
	echo "3. 安装chisel  （fb提供的一个lldb增强工具）"
	echo "4. 更改gem source源到ruby-china （gem自带源在中国太慢，更换到ruby-china，taobao提供的源已停用）"
	echo "5. 安装oh-my-zsh (一个命令行的增强工具，很强大)"
	echo "6. 安装Cocoapods"
	echo "7. 安装carthage"
	echo "8. 安装clang-format"
	echo "======================以下几项需要指定安装项目的目录位置======================================="
	echo "======================你可以在terminal中进入到目录后，输入pwd获得目录地址======================================="
	echo "9. 安装clang-format的格式文件"
	echo "10. 添加gitattributes防止pbxproj conflict"
	echo "11. 安装commit hook自动规范代码（需要先安装clang-format并且确保你的根目录有.git文件夹）"
	echo "12. 安装Objective-C版本的gitignore"
	echo "13. 安装Swift版本的gitignore"


	read -p "输入编号：" number

	case $number in 
		1) installbrew
		;;
		2) installGitflow
		;;
		3) installChisel
		;;
		4) installGemSource
		;;
		5) installOhMyZsh
		;;
		6) installCocoapods
		;;
		7) installCarthage
		;; 
		8) installClangformat
		;;
		9) installClangformatStyle
		;;
		10) installGitattributes
		;;
		11) installCommithook
		;;
		12) installOCGitignore
		;;
		13) installSwiftGitignore
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

	else
		echo "已经安装clang-format"
	fi
}

installClangformatStyle() {
	read -p "项目的根目录地址是：" address
	echo "正在下载clang style 文件"
	curl https://gist.githubusercontent.com/zangqilong198812/66331d5325cd2fb2d3e3015f97fb030a/raw/182884cecd0db7508a6c50b3d4ba2e62ea52139c/gistfile1.txt > $address/.clang-format
}

installCommithook() {
	read -p "项目的根目录地址是：" address
	echo "下载pre-commit文件"
	curl https://gist.githubusercontent.com/zangqilong198812/20075e94ee2a070060465d1f9bb68ae6/raw/97ef6efa45de51d76697ae1de404493dfdc99d9d/gistfile1.txt > $address/.git/hooks/pre-commit
	chmod a+x ../.git/hooks/pre-commit
}

installGitattributes() {
	read -p "项目的根目录地址是：" address
	echo "设置gitattributes"
	echo "*.pbxproj merge=union" > $address/.gitattributes
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

installOCGitignore() {
	read -p "项目的根目录地址是：" address
	echo "下载Objective-C .gitignore文件"
	curl https://gist.githubusercontent.com/zangqilong198812/d69b70613739a4e1ec3d20ad5f4a9cbe/raw/fca741cfa83736e64b3fed0819de5e8098286704/gistfile1.txt > $address/.gitignore
	cd $address
	git rm -r --cached .
	git add .
	git commit -m "Add Objective-C gitignore"
}

installSwiftGitignore() {
	read -p "项目的根目录地址是：" address
	echo "下载Swift .gitignore文件"
	curl https://gist.githubusercontent.com/zangqilong198812/2b87d03ec7d60cf2a1d95fc0dc34ad58/raw/8261ccb13359156f4510dfccc3a44e0d7bba0902/gistfile1.txt > $address/.gitignore
	cd $address
	git rm -r --cached .
	git add .
	git commit -m "Add Swift gitignore"
}

####################################################
showMenu





