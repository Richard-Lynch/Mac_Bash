#---------------------PYTHON---------------------
# Setting PATH for Python 3.5
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

#---------------------HIDDEN FILES---------------------
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

#---------------------Style of Terminal---------------------
bold=$(tput bold)
line=$(tput setab 0)
reset=$(tput sgr0)
# export PS1="${line}_____________________________________________________________\t_\d${reset}\n${bold}(\u) @ \w ${reset}"
# export PS1="${line}_____________________________________________________________\t_\d${reset}\n${bold}\W ${reset}"
export PS1="\[${bold}\]\u @ \w \[${reset}\]" # super small
# ok so the \[ and \] around the bold and reset, basically tell absh that these values have size 0,so it doesnt 
# grab random old commands and append them on to your PS1 when searching through history
# export PS1="${bold}\w ${reset}" # super small

# compile () {
#     gcc -w "$1"   ;
#     chmod x+u "$1".out      ;
# }

#---------------------TEMP---------------------

#---------------------SHORTCUTS---------------------
alias b="(cd && code .bash_profile)"					# opens bash profile
alias p="cd /Users/Richard/GoogleDrive/Programs"		# navigates to programs folder
alias ht="sudo htop"                                    # opens a better top
alias cloud="ssh -R 2210:localhost:22 richie@199.19.226.161"
# curl -u USERNAME -O https://WEBADDRESS/FILELOCATION/FILENAME.c
# ps -A lists all processes

# dirs      #lists the current directories on the dir stack 
# dirs -v   #lists the stack vertically with index's
# pushd     #pushes the current dir onto the stack
# popd      #pops the top dir from the stack
# touch ~1/test.txt #creares the file test.txt in the location stored in the first index of the array ( could be second third fourth index )
# !!        #is the last command you executed
# sudo !!   #so use this if you forget sudo use
alias dirs="dirs -v"    #lists the stack vertically with index's
alias h="history"  #lists history of commands
# !:21           #reuses command 21 from the history list above ( or the 11st argument from the last command if put in the posotion of an arguemnt )
# !111:1        #reuses arguemnt 1 from command 111 from above list
# ALT + [argument number] # selects arugment(including command ( index 0 )) from last command -> CTRL + ALT + Y (for yank) will paste to screen 

# vim   gotta use
# vimtutor : learn to use vim

# tmux ( installed with brew ) -> allows for multiple bash sessions in one screen with multiple threads, and allows ssh'ing between machiens with shared stuff
# tmux attach -t SESSION_NAME

# ---build and compile from source---
# sudo apt-get install build-essential
# get the source file (.tar.gz or .tar.bz2)
# tar -xzvf file.tar.gz OR tar -xjvf file.tar.bz2
# cd filedir
# ./configure ( or install/readme )
# install dependecies
# (note, if there is an old version of the package in you repos, sudo apt-get build-dep packagename will download all of the dependencies )
# make ( builds the program for your system )
# sudo make install ( installs the program )
# dont delete this directory because - 
# sudo make uninstall
# will uninstall the file

# ---google searches---
# filetype:pdf ireland -start ( returns pdfs containing ireland, but does not have the word startup )

# ---mac updater---
# mas list          //list app updates
# mas outdated      //lists outdated apps
# mas upgrade       //updates all apps
# mas search  appName      //lists all search results
# mas install applicationNumber //install applicationNumber
# softwareupdate -l     //lists available updates for OS
# sudo softwareupdate -ia --verbose     //updates current OS software

lcd () {
    cd "$1"         ;
    ls              ;
}

alias ..="cd ../"
alias ...="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
alias .6="cd ../../../../../../"

#---------------------Utilities---------------------
# Refresh Bash profile, commit and push to github and backup
sb () {                                                         # refresh and backup bash_profile
    (cd                                             ;           # open parenthesis creates subshell to execute from home dir                                                     
    git commit -qv -am "$1"	                        ;           # commits all to git - requires message
    git push  -qv origin master	                    ;           # pushes all to remote
    cp -iv ~/.bash_profile ~/.bback/bash_profile.backup.$(date +%Y-%m-%d_%H:%M:%S)   ;   # backup bash profile
    )   #outside of the subshell
    source ~/.bash_profile                          ;           # refresh bash_profile
    }

create () {
    touch $1        ;
    chmod u+x $1    ;
}
alias sbu="source ~/.bash_profile"

#---------------------SHELL PRACTICE---------------------
# alias ns="code /Users/Richard/GoogleDrive/Documents/College/Eng_2016-2017/shell/script.sh"
# alias S="cd /Users/Richard/GoogleDrive/Documents/College/Eng_2016-2017/shell"
# alias s="/Users/Richard/GoogleDrive/Documents/College/Eng_2016-2017/shell/script.sh"

#---------------------PREFERED COMMANDS---------------------
alias ls="ls -FG"  #lists file with color and annotation
alias lsa="ls -FGA"	#lists all including hidden colors etc
alias lsal="ls -FGlAhp" #lists as above + permissions
alias cp="cp -irv" 	#copys but warns if there will be an override
alias mv="mv -irv"	#moves but warns if there will be an override
alias mkdir="mkdir -p"     #creates intermediate dirs if required and is verbose
alias cl="clear && cd"   #clear and return home

#---------------------GIT---------------------
# git merge Feature-A   //merges Feature-A branch with master branch
# this will not require any commits, but will require a push to the remote
# git branch -d con   //will delete the con branch
# git brnach -l         //will list the local branches
# git push --set-upstream origin test       //create upstream branch of test on remote



alias gcommit="git commit -am"		# commits all to git
alias gpush="git push origin"	# pushes all to remote

gcp () {                                # copies a folder to a new folder, and creates a new git/github repo for it, and pushes everything
    cp "$1" "$2"                        ;
    cd $2                                 ;
    sudo rm -rv .git                 ;
    # -new git repo, adds and commits all files to repo-
    git init                        ;
    git add .                       ;
    git commit -am "First commit from copy of $1 to $2"   ;
    # -remote github repos, adds remote origin, verifys, pushs-
    curl -u 'Richard-Lynch' https://api.github.com/user/repos -d "{\"name\":\"$2\"}"   ;
    git remote add origin https://github.com/Richard-Lynch/$2.git                      ;
    git remote -v                   ;
    git push -u origin master       ;              
    git commit -am "Copied $2 from $1"  ;
    git push origin master          ;
}

gbl () {
    git branch -l                     ;
}

gadd () {
    create "$1"                       ;
    git add "$1"                      ;
    git commit -am "Created $1"     ;
    git push origin master          ;
}
# --New Git Repo--
gnew () {
    # -new directory, empty readme, .vscode template-
    mkdir -p "$1" && cd "$1"        ;
    touch readme.txt                ;
    # mkdir -p .vscode && cd .vscode  ;
    cp -r ~/GoogleDrive/Programs/VS_Templates/"$2"/.vscode .vscode ;
    cp -r ~/GoogleDrive/Programs/VS_Templates/"$2"/main."$2" main."$2" ;
    # -new git repo, adds and commits all files to repo-
    git init                        ;
    git add .                       ;
    git commit -am "First commit"   ;
    # -remote github repos, adds remote origin, verifys, pushs-
    curl -u 'Richard-Lynch' https://api.github.com/user/repos -d "{\"name\":\"$1\"}"   ;
    git remote add origin https://github.com/Richard-Lynch/$1.git                      ;
    git remote -v                   ;
    git push -u origin master       ;
    }
	
