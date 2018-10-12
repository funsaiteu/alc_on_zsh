#!/bin/zsh

# option
CMDNAME=`basename $0`
while getopts i OPT
do
  case $OPT in
    "i" ) FLG_i="TRUE" ;;
      * ) echo "Usage: $CMDNAME [-i] word" 1>&2
          exit 1;;
  esac
done
shift `expr $OPTIND - 1`
# color
red=`tput setaf 1`
white=`tput setaf 7`
reset=`tput sgr0`
local NUM=`w3m -dump "http://eow.alc.co.jp/"$1 | grep -n 単語帳 | head -1 | awk -F ':' '{print $1}'`
local NULL=""
if [[ $NUM = $NULL ]]; then
  echo "${red}failed${reset}"
else
  NUM=`expr $NUM - 1`
  local dic=`w3m -dump 'http://eow.alc.co.jp/search?q='$1 | head -$NUM | tail -n +36`
  echo "${white}${dic}${reset}"
fi
