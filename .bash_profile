#-----PYTHON----
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

#-----HIDDEN FILES----
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

#----Look of Terminal----
bold=$(tput bold)
line=$(tput setab 0)
reset=$(tput sgr0)
export PS1="${line}________________________________________________________________________________${reset}\n${bold}\t (\u) @ \w \n${reset}"


#----TEMP----

#-----SHORTCUTS----
alias b="code ~/.bash_profile"					# opens bash profile
alias p="cd /Users/Richard/GoogleDrive/Programs"		# navigates to programs folder
#-----Utilities-----
sb () {                                                         # refresh and backup bash_profile
    (cd                                             ;           # open parenthesis creates subshell to execute from home dir                                                     
    git commit -q -am "$1"	                        ;           # commits all to git - requires message
    git push  -q origin master	                    ;           # pushes all to remote
    cp -iv ~/.bash_profile ~/bback/bash_profile.backup.$(date +%Y-%m-%d_%H:%M:%S)   ;   # backup bash profile
    )   #outside of the subshell
    source ~/.bash_profile                          ;           # refresh bash_profile
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
create () {
    touch $1        ;
    chmod u+x $1    ;
}

#----GIT----
alias gcommit="git commit -am"		# commits all to git
alias gpush="git push origin master"	# pushes all to remote
gadd () {
    create $1                       ;
    git add $1                      ;
    git commit -am "Created $1"     ;
    git push origin master          ;
}
# --New Git Repo--
# Creates;  new directory, empty readme, new git repo, remote github repos
# Actions;  adds and commits all files to repo, adds remote origin, verifys, pushs
gnew () {
    mkdir -p "$1" && cd "$1"        ;
    touch readme.txt                ;
    git init                        ;
    git add .                       ;
    git commit -am "First commit"   ;
    curl -u 'Richard-Lynch' https://api.github.com/user/repos -d "{\"name\":\"$1\"}"   ;
    git remote add origin https://github.com/Richard-Lynch/$1.git                      ;
    git remote -v                   ;
    git push -u origin master       ;
    }
	
