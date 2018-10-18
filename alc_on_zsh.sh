#!/bin/zsh

# option
CMDNAME=`basename $0`
while getopts hio OPT
do
  case $OPT in
    "i" ) FLG_i="TRUE" ;;
    "h" ) FLG_h="TRUE" ;;
    "o" ) FLG_o="TRUE" ;;
      * ) echo "Usage: $CMDNAME [-i] word" 1>&2
          exit 1;;
  esac
done
shift `expr $OPTIND - 1`
if [[ "$FLG_h" = "TRUE" ]]; then
  echo "
    Usage: $CMDNAME [-i] word
  " | sed  -e 's/^ *//g' -e '1d' -e '$d'
fi
if [[ "$FLG_o" = "TRUE" ]]; then
  open 'http://eow.alc.co.jp/search?q='$1
  exit 0
fi
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
exit 0
