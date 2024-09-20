#
# wm independent hotkeys
#
# /usr/bin/warp-terminal

# terminal emulator
super + Return
	/usr/bin/kitty

# program launcher
super + d
	/usr/bin/rofi -show run

# make sxhkd reload its configuration files:
alt +  Escape
	pkill -USR1 -x sxhkd

#
# bspwm hotkeys
#

# quit/restart bspwm
super + shift + ctrl + {w,r}
	bspc {quit,wm -r}

# close and kill
super + alt + {q,k}
    bspc node -{c,k}
    
# alternate between the tiled and monocle layout
super + m
	bspc desktop -l next

# send the newest marked node to the newest preselected node
super + y
	bspc node newest.marked.local -n newest.!automatic.local

# swap the current node and the biggest window
super + g
	bspc node -s biggest.window

#
# state/flags
#

# set the window state
super + {t,shift + t,s,f}
	bspc node -t {tiled,pseudo_tiled,floating,fullscreen}

# set the node flags
super + ctrl + {m,x,y,z}
	bspc node -g {marked,locked,sticky,private}

#
# focus/swap
#

# focus the node in the given direction
super + {_,shift + }{Left,Down,Up,Right}
	bspc node -{f,s} {west,south,north,east}

# focus the node for the given path jump
super + {p,b,comma,period}
	bspc node -f @{parent,brother,first,second}

# focus the next/previous window in the current desktop
super + {_,shift + }c
	bspc node -f {next,prev}.local.!hidden.window

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
