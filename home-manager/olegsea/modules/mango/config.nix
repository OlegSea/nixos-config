{ ... }:
{
  wayland.windowManager.mango = {
    settings = ''
      #### MangoWC Main Configuration ####

      # Input configuration
      xkb_rules_layout=us,ru
      xkb_rules_options=grp:win_space_toggle,caps:escape
      accel_profile=1
      trackpad_natural_scrolling=1

      # Monitor configuration (new format: name:VALUE,width:VALUE,height:VALUE,refresh:VALUE,x:VALUE,y:VALUE,scale:VALUE,vrr:VALUE)
      monitorrule=name:eDP-1,width:2880,height:1620,refresh:120,x:0,y:0,scale:2,vrr:1
      #monitorrule=name:DP-1,width:1920,height:1080,refresh:165,x:0,y:0,scale:1,vrr:1
      monitorrule=name:HDMI-A-1,width:1920,height:1080,refresh:180,x:1440,y:0,scale:1,vrr:1
      allow_tearing=1

      # Environment variables
      env=GTK_THEME,Adwaita:dark
      env=XCURSOR_SIZE,16
      env=QT_AUTO_SCREEN_SCALE_FACTOR,1

      # Layout settings
      nmaster=1
      mfact=0.55
      scroller_default_proportion=1.0
      scroller_proportion_preset=0.5,1.0
      scroller_structs=3

      tagrule=id:1,layout_name:scroller
      tagrule=id:2,layout_name:scroller
      tagrule=id:3,layout_name:scroller
      tagrule=id:4,layout_name:scroller
      tagrule=id:5,layout_name:scroller
      tagrule=id:6,layout_name:scroller
      tagrule=id:7,layout_name:scroller
      tagrule=id:8,layout_name:scroller
      tagrule=id:9,layout_name:scroller

      # Focus settings
      cursor_follows_focus=1

      # Window rules for tag assignment
      windowrule=tags:1,title:Vivaldi
      windowrule=tags:1,appid:vivaldi-stable

      windowrule=tags:2,appid:dev.zed.Zed
      windowrule=tags:2,appid:kitty

      windowrule=tags:3,appid:discord
      windowrule=tags:3,appid:org.telegram.desktop
      windowrule=tags:3,appid:Spotify

      windowrule=tags:4,appid:throne
      windowrule=tags:4,appid:org.keepassxc.KeePassXC

      windowrule=monitor:HDMI-A-1,title:Vivaldi
      windowrule=monitor:HDMI-A-1,appid:vivaldi-stable

      windowrule=monitor:HDMI-A-1,appid:dev.zed.Zed
      windowrule=monitor:HDMI-A-1,appid:kitty

      windowrule=monitor:eDP-1,appid:discord
      windowrule=monitor:eDP-1,appid:org.telegram.desktop
      windowrule=monitor:eDP-1,appid:Spotify

      windowrule=monitor:eDP-1,appid:throne
      windowrule=monitor:eDP-1,appid:org.keepassxc.KeePassXC

      # Floating windows
      windowrule=float,title:Picture in picture
      windowrule=float,appid:mpv
      windowrule=float,appid:pavucontrol
      windowrule=float,appid:blueman-manager
      windowrule=float,title:Open File
      windowrule=float,title:Save File

      # Games
      windowrule=force_tearing:1,title:Minecraft.*
      windowrule=force_tearing:1,appid:osu!

      # Autostart applications
      exec-once=swaybg -i /home/olegsea/flake/resources/wallpaper.png
      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
      exec-once=noctalia-shell
      exec-once=vivaldi
      exec-once=kitty
      exec-once=spotify
      exec-once=Telegram
      exec-once=discord
    '';
  };
}
