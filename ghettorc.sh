#!/bin/bash
#

# General config:

SITE=$HOME/whatever
SITELOG=/var/log/nginx/*error.log

# Ghettodotfilez aliases:

# getting around:
alias err="tail -`expr $LINES - 1` $SITELOG | less -S +G"
alias q="rlwrap ~/q/l32/q"

# git specific:
alias gs='git status | less'
git config merge.conflictstyle diff3
git config --global status.submoduleSummary true

# DESCRIPTION:
#
#   Set the bash prompt according to:
#    * the branch/status of the current git repository
#    * the branch of the current subversion repository
#    * the return value of the previous command
# 
# USAGE:
#
#   1. Save this file as ~/.git_svn_bash_prompt
#   2. Add the following line to the end of your ~/.profile or ~/.bash_profile:
#        . ~/.git_svn_bash_prompt
#
# AUTHOR:
# 
#   Scott Woods <scott@westarete.com>
#   West Arete Computing
#
#   Based on work by halbtuerke and lakiolen.
#
#   http://gist.github.com/31967


# The various escape codes that we can use to color our prompt.
        RED="\[\033[0;31m\]"
  LIGHT_RED="\[\033[1;31m\]"
     YELLOW="\[\033[0;33m\]"
      GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
       BLUE="\[\033[0;34m\]"
 LIGHT_BLUE="\[\033[1;34m\]"
       CYAN="\[\033[0;36m\]"
 LIGHT_CYAN="\[\033[1;36m\]"
      WHITE="\[\033[1;37m\]"
       GRAY="\[\033[1;30m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

# Detect whether the current directory is a git repository.
function is_git_repository {
  git branch > /dev/null 2>&1
}

# Detect whether the current directory is a subversion repository.
function is_svn_repository {
  test -d .svn
}

# Determine the branch/state information for this git repository.
function set_git_branch {
  # Capture the output of the "git status" command.
	if [ ! -d .git ]; then
		return
	fi
  git_status="$(git status 2> /dev/null)"

  # Set color based on clean/staged/dirty.
  if [[ ${git_status} =~ "working directory clean" ]]; then
    state="${GREEN}"
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${YELLOW}"
  else
    state="${RED}"
  fi
  
  # Set arrow icon based on status against remote.
  remote_pattern="# Your branch is (.*) of"
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="↑"
    else
      remote="↓"
    fi
  else
    remote=""
  fi
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote="↕"
  fi
  
  # Get the name of the branch.
  branch_pattern="^# On branch ([^${IFS}]*)"    
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
  fi

  # Set the final branch string.
	if [[ "x$branch" != "x" ]]; then
		BRANCH="${state}(${branch})${remote}${COLOR_NONE} "
	else
		BRANCH=""
	fi
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol () {
  if test $1 -eq 0 ; then
      PROMPT_SYMBOL="\$"
  else
      PROMPT_SYMBOL="${RED}\$${COLOR_NONE}"
  fi
}

# Set the full bash prompt.
function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the 
  # return value of the last command.
  set_prompt_symbol $?

  # Set the BRANCH variable.
  if is_git_repository ; then
    set_git_branch
  else
    BRANCH=''
  fi
  
  PS1="\[\033]0;\u@\h \w\a\]${GRAY}\u@\h \w \# \t ${COLOR_NONE}${BRANCH}${PROMPT_SYMBOL} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt

HOSTNAME=`hostname -s`
echo -e "\033khost=$HOSTNAME\033\\"

LS_COLORS="di=01;36;40:ow=01;36;40" && export LS_COLORS

# enable full history in erlang / iex
export ERL_AFLAGS="-kernel shell_history enabled"

which screen && screen -ls && echo 'run screen -rdx'

