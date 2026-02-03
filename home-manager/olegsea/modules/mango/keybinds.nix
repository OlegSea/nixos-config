{ ... }:
{
  wayland.windowManager.mango = {
    settings = ''
      #### MangoWC Keybindings Configuration ####

      # Terminal and launcher binds
      bind=SUPER,Return,spawn,kitty
      bind=SUPER,d,spawn,noctalia-shell ipc call launcher toggle

      # Clipboard and power menu
      bind=SUPER,c,spawn,noctalia-shell ipc call launcher clipboard
      bind=SUPER,Escape,spawn,noctalia-shell ipc call sessionMenu toggle

      # Screen lock
      bind=SUPER+ALT,l,spawn,noctalia-shell ipc call lockScreen lock

      # Notifications
      bind=SUPER,n,spawn_shell,swaync-client -op

      # Audio controls
      bind=NONE,XF86AudioRaiseVolume,spawn_shell,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01+
      bind=NONE,XF86AudioLowerVolume,spawn_shell,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.01-
      bind=NONE,XF86AudioMute,spawn_shell,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind=NONE,XF86AudioMicMute,spawn_shell,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bind=NONE,XF86AudioPlay,spawn_shell,playerctl play-pause
      bind=NONE,XF86AudioNext,spawn_shell,playerctl next
      bind=NONE,XF86AudioPrev,spawn_shell,playerctl previous

      # Brightness controls
      bind=NONE,XF86MonBrightnessUp,spawn,brightnessctl --class=backlight set +10%
      bind=NONE,XF86MonBrightnessDown,spawn,brightnessctl --class=backlight set 10%-

      # Window management
      bind=SUPER+SHIFT,q,killclient
      bind=SUPER,o,toggleoverview

      # Focus controls
      bind=SUPER,h,focusstack,prev
      bind=SUPER,j,viewtoright
      bind=SUPER,k,viewtoleft
      bind=SUPER,l,focusstack,next
      bind=SUPER,Left,focusstack,prev
      bind=SUPER,Right,focusstack,next
      bind=SUPER,Up,focusstack,prev
      bind=SUPER,Down,focusstack,next

      # Window movement
      bind=SUPER+SHIFT,h,exchange_client,l
      bind=SUPER+SHIFT,j,exchange_client,d
      bind=SUPER+SHIFT,k,exchange_client,u
      bind=SUPER+SHIFT,l,exchange_client,r
      bind=SUPER+SHIFT,Left,exchange_client,l
      bind=SUPER+SHIFT,Right,exchange_client,r
      bind=SUPER+SHIFT,Up,exchange_client,u
      bind=SUPER+SHIFT,Down,exchange_client,d

      # Monitor focus
      # bind=SUPER,Comma,spawn_shell,notify-send hello
      bind=SUPER,comma,focusmon,eDP-1
      bind=SUPER,period,focusmon,HDMI-A-1
      # bind=SUPER+CTRL,k,focusmon,u
      # bind=SUPER+CTRL,l,focusmon,r
      # bind=SUPER+CTRL,Left,focusmon,l
      # bind=SUPER+CTRL,Right,focusmon,r
      # bind=SUPER+CTRL,Up,focusmon,u
      # bind=SUPER+CTRL,Down,focusmon,d

      # Move windows to monitors
      bind=SUPER+SHIFT,comma,tagmon,eDP-1,0
      bind=SUPER+SHIFT,period,tagmon,HDMI-A-1,0
      # bind=SUPER+SHIFT+CTRL,k,tagmon,u,0
      # bind=SUPER+SHIFT+CTRL,l,tagmon,r,0
      # bind=SUPER+SHIFT+CTRL,Left,tagmon,l,0
      # bind=SUPER+SHIFT+CTRL,Right,tagmon,r,0
      # bind=SUPER+SHIFT+CTRL,Up,tagmon,u,0
      # bind=SUPER+SHIFT+CTRL,Down,tagmon,d,0

      # Tag/workspace switching
      bind=SUPER,1,view,1
      bind=SUPER,2,view,2
      bind=SUPER,3,view,3
      bind=SUPER,4,view,4
      bind=SUPER,5,view,5
      bind=SUPER,6,view,6
      bind=SUPER,7,view,7
      bind=SUPER,8,view,8
      bind=SUPER,9,view,9

      # Move windows to tags
      bind=SUPER+SHIFT,1,tag,1
      bind=SUPER+SHIFT,2,tag,2
      bind=SUPER+SHIFT,3,tag,3
      bind=SUPER+SHIFT,4,tag,4
      bind=SUPER+SHIFT,5,tag,5
      bind=SUPER+SHIFT,6,tag,6
      bind=SUPER+SHIFT,7,tag,7
      bind=SUPER+SHIFT,8,tag,8
      bind=SUPER+SHIFT,9,tag,9

      # Additional workspace navigation
      bind=SUPER,u,viewtoleft
      bind=SUPER,i,viewtoright

      # Layout and window controls
      bind=SUPER,f,switch_proportion_preset
      bind=SUPER+SHIFT,f,togglefullscreen
      bind=SUPER,v,togglefloating

      # Resizing windows
      bind=SUPER,minus,setmfact,-0.05
      bind=SUPER,equal,setmfact,+0.05

      # Config reload
      bind=SUPER+SHIFT,r,reload_config

      # System controls
      bind=SUPER+SHIFT,e,quit

      # Mouse bindings
      mousebind=SUPER,btn_left,moveresize,curmove
      mousebind=SUPER,btn_right,moveresize,curresize

      axisbind=SUPER,UP,focusstack,prev
      axisbind=SUPER,DOWN,focusstack,next

      # Named scratchpad for quick terminal access
      bind=SUPER,grave,toggle_name_scratchpad,kitty,Quick Terminal,1200,800,kitty --title="Quick Terminal"

      # Screenshot bindings (using hyprshot)
      bind=NONE,Print,spawn,hyprshot -m region
      bind=CTRL,Print,spawn,hyprshot -m output
      bind=ALT,Print,spawn,hyprshot -m window -m active

      # 3-finger swipe to move focus
      gesturebind=none,left,3,focusstack,next
      gesturebind=none,right,3,focusstack,prev
      gesturebind=none,up,3,viewtoright
      gesturebind=none,down,3,viewtoleft
    '';
  };
}
