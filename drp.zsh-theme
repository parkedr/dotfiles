#!/bin/bash

# ========== CONFIG ========== #

# 1: with smileys 
# 0: without smileys
local SM_WITH_SMILEYS=1;

# 2: with 2 lines 
# else: default ( 3 lines )
local SM_PROMPT_LINES=3;

# ============================ #

# display emojis or pictos
pictos_or_smileys () {
    local emojis=(" ✘" "[ಠ_ಠ]" " ✔︎" "[･‿･]");
    if [ "$1" -eq 0 ] ; then echo "%F{red}${emojis[1 + $SM_WITH_SMILEYS]}%F{default}" ;
    elif [ "$1" -eq 1 ] ; then echo "%F{green}${emojis[3 + $SM_WITH_SMILEYS]}%F{default}" ; fi
}

# display red user if sudo is enabeled
sudo_color() {
    if [ "$UID" -eq 0 ] ; then echo "red" ; 
    else echo "default" ; fi
}

# custom zsh prompt
local return_code="%(?..%F{red}%? - )%F{default}";
local SM_PREFIX="%F{default}╭─";
local SM_MIDFIX="%F{default}├─ "
local SM_SUFFIX="%F{default}╰───%F{default} ";
local SM_USER="%F{$(sudo_color)}%n%F{white}@%m";
local SM_DIR="%F{blue}%~%F{default}";
local SM_CLOCK="${return_code}%F{default}%W% / %T";

sm_prompt() {
    if [ $SM_PROMPT_LINES -eq 2 ] ; then
        echo '$SM_PREFIX $SM_USER $SM_DIR $(git_prompt_info) $(git_prompt_status)
$SM_SUFFIX' 
    else echo '$SM_PREFIX $SM_USER $(git_prompt_info) $(git_prompt_status)
$SM_MIDFIX $SM_DIR
$SM_SUFFIX' ; fi
}


# set new prompt
PROMPT=$(sm_prompt)
RPROMPT="$SM_CLOCK";

# update vcs values
ZSH_THEME_GIT_PROMPT_PREFIX="%F{white}  %F{default}";
ZSH_THEME_GIT_PROMPT_SUFFIX="";
ZSH_THEME_GIT_PROMPT_DIRTY=$(pictos_or_smileys 0);
ZSH_THEME_GIT_PROMPT_CLEAN=$(pictos_or_smileys 1);
ZSH_THEME_GIT_PROMPT_ADDED="%F{green}●%F{default} ";
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}◎%F{default} ";
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}○%F{default} ";
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}‣%F{default} ";
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{magenta}✦%F{default} ";
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{magenta}✖%F{default} ";

