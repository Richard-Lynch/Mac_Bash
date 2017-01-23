#-----PYTHON----
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

#-----HIDDEN FILES----
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

#----VS CODE----
# code .	//opens code in the current dir
# code file.txt //opens the file with code 


#----TEMP----
export PS1="________________________________________________________________________________\n(\u) @ \w \n"

#-----SHORTCUTS----
alias b="code ~/.bash_profile"					# opens bash profile
alias p="cd /Users/Richard/GoogleDrive/Programs"		# navigates to programs folder
#-----Utilities-----
sb () {                                                         #refresh and backup bash_profile   
    git commit -q -am "$1"	                        ;           # commits all to git - requires message
    git push  -q origin master	                        ;           # pushes all to remote
    source ~/.bash_profile                          ;           # refresh bash_profile
    cp -iv ~/.bash_profile ~/bback/bash_profile.backup.$(date +%Y-%m-%d_%H:%M:%S)   ;   # backup bash profile
    }

#-----SHELL PRACTICE----
alias ns="code /Users/Richard/GoogleDrive/Documents/College/Eng_2016-2017/shell/script.sh"
alias S="cd /Users/Richard/GoogleDrive/Documents/College/Eng_2016-2017/shell"
alias s=" /Users/Richard/GoogleDrive/Documents/College/Eng_2016-2017/shell/script.sh"


#----PREFERED COMMANDS----
alias ls="ls -FG"  #lists file with color and annotation
alias lsa="ls -FGA"	#lists all including hidden colors etc
alias lsal="ls -FGlAhp" #lists as above + permissions
alias cp="cp -iv" 	#copys but warns if there will be an override
alias mv="mv -iv"	#moves but warns if there will be an override
alias mkdir="mkdir -p"     #creates intermediate dirs if required and is verbose

#----GIT----
alias gcommit="git commit -am"		# commits all to git
alias gpush="git push origin master"	# pushes all to remote
# --New Git Repo--
# Creates;  new directory, empty readme, new git repo, remote github repos
# Actions;  adds and commits all files to repo, adds remote origin, verifys, pushs
gnew () {
    mkdir -p "$1" && cd "$1"        ;
    touch readme.txt                ;
    git init                        ;
    git add .                       ;
    git commit -m "First commit"    ;
    curl -u 'Richard-Lynch' https://api.github.com/user/repos -d "{\"name\":\"$1\"}"   ;
    git remote add origin https://github.com/Richard-Lynch/$1.git                      ;
    git remote -v                   ;
    git push -u origin master       ;
    }
	
