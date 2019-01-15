#!/usr/bin/env bash
#cat ~/.config/sxhkd/sxhkdrc | \
#  awk '/^[a-z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' | \
#  column -t -s $'\t'| \
#  rofi -dmenu -matching fuzzy -only-match -location 0 -p "Sxhdk"


list=$( awk '/^[a-z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' ~/.config/sxhkd/sxhkdrc| \
  column -t -s $'\t' )

comm=$( (echo "$list") | rofi -dmenu -matching fuzzy -only-match -location 0 -p "Sxhdk" )
comm=$( echo "$comm" | sed 's/\#[ ]*/\n\n/g' )
dunstify -a "Sxhkd helper" -u low "$comm"
exit 0
