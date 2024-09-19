  GNU nano 7.2                                                                                                   sxhkdrc                                                                                                              

# focus the next/previous desktop in the current monitor
super + bracket{left,right}
    bspc desktop -f {prev,next}.local

# focus the last node/desktop
super + {grave,Tab}
    bspc {node,desktop} -f last

# focus the older or newer node in the focus history
super + {o,i}
    bspc wm -h off; \
    bspc node {older,newer} -f; \
    bspc wm -h on

# focus or send to the given desktop
super + {_,alt + }{1-9,0}
    bspc {desktop -f,node -d} '^{1-9,10}'

#
# preselect
#

# preselect the direction
super + ctrl + alt + {Left,Down,Up,Right}
    bspc node -p {west,south,north,east}

# preselect the ratio
super + ctrl + {1-9}
    bspc node -o 0.{1-9}

# cancel the preselection for the focused node
super + ctrl + alt + space
    bspc node -p cancel

# cancel the preselection for the focused desktop
super + ctrl + shift + space
    bspc query -N -d | xargs -I id -n 1 bspc node id -p cancel

#
# move/resize
#

# move a floating window
super + shift + {Left,Down,Up,Right}
    bspc node -v {-20 0,0 20,0 -20,20 0}

#Custom Resize
super + alt + {Left,Down,Up,Right}
    /home/user/.config/bspwm/scripts/bspwm_resize {west,south,north,east}

# Open Firefox
super + shift + f
    /usr/bin/firefox
