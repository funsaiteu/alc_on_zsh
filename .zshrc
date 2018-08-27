function alc() {
  red=`tput setaf 1`
  white=`tput setaf 7`
  reset=`tput sgr0`
  local NUM=`w3m -dump "http://eow.alc.co.jp/"$1 | grep -n 単語帳 | head -1 | cut -c 1-2`
  local NULL=""
  if [[ $NUM = $NULL ]]; then
    echo "${red}failed${reset}"
  else
    NUM=`expr $NUM - 1`
    local dic=`w3m -dump 'http://eow.alc.co.jp/search?q='$1 | head -$NUM | tail -n +36`
    echo "${white}${dic}${reset}"
  fi
}
# you can type + that is instead of space.
alias a="alc"
