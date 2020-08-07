XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME
export PATH=~/.local/bin:$PATH

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
