( sleep 0.8 && xcompmgr & ) &
( sleep 0.6 && feh --bg-fill ~/Pictures/endeavour_launch.jpg ) &
( sleep 1.6 && feh --bg-fill ~/Pictures/endeavour_launch.jpg ) &
( sleep 2.0 && feh --bg-fill ~/Pictures/endeavour_launch.jpg ) &
( sleep 2.5 && feh --bg-fill ~/Pictures/endeavour_launch.jpg ) &
( sleep 3.0 && feh --bg-fill ~/Pictures/endeavour_launch.jpg ) &
( sleep 4.0 && feh --bg-fill ~/Pictures/endeavour_launch.jpg ) &
( sleep 5.0 && feh --bg-fill ~/Pictures/endeavour_launch.jpg ) &
( sleep 1.0 && flameshot ) &
( sleep 1.0 && dlauncher ) &

# export XMODIFIERS='@im=SCIM'
# export LC_CTYPE=ja_JP.utf8
# export GTK_IM_MODULE="scim"
# export QT_IM_MODULE="scim"
# scim -d

#export XMODIFIERS=@im=ibus
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus

#( sleep 1.0 && ibus-daemon -drx ) &

exec awesome
