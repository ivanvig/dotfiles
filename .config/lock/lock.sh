letterEnteredColor=d79921ff
letterRemovedColor=cc241dff
passwordCorrect=00000000
passwordIncorrect=fb4934ff
background=928374ff
foreground=ebdbb2ff
locktext='Type password to unlock...'

for queue in /tmp/polybar_mqueue.*; do echo cmd:hide > ${queue}; done
for id in $(bspc query -D); do bspc node @${id}:/ -g hidden=on; done

i3lock \
  --nofork \
  --color=282828 \
  --timepos='x+110:h-70' \
  --datepos='x+43:h-45' \
  --clock --date-align 1 --datestr "$locktext" \
  --insidecolor=$background --ringcolor=$foreground --line-uses-inside \
  --keyhlcolor=$letterEnteredColor --bshlcolor=$letterRemovedColor --separatorcolor=$background \
  --insidevercolor=$passwordCorrect --insidewrongcolor=$passwordIncorrect \
  --ringvercolor=$foreground --ringwrongcolor=$foreground --indpos='x+280:h-70' \
  --radius=20 --ring-width=4 --veriftext='' --wrongtext='' \
  --verifcolor="$foreground" --timecolor="$foreground" --datecolor="$foreground" \
  --noinputtext='' --force-clock &

wait
for queue in /tmp/polybar_mqueue.*; do echo cmd:show > ${queue}; done
for id in $(bspc query -D); do bspc node @${id}:/ -g hidden=off; done
