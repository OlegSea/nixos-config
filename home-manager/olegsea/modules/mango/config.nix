{ ... }:
{
  wayland.windowManager.mango = {
    settings = ''
      #### MangoWC Main Configuration ####

      # Input configuration
      xkb_rules_layout=us,ru
      xkb_rules_options=grp:win_space_toggle,caps:escape

      # Monitor configuration
      monitorrule=eDP-1,0.55,1,scroller,0,2,0,0,2880,1620,120
      #monitorrule=DP-1,0.55,1,scroller,0,1,0,0,1920,1080,165
      monitorrule=HDMI-A-1,0.55,1,scroller,0,1,1440,0,1920,1080,180

      # Environment variables
      env=GTK_THEME,Adwaita:dark
      env=XCURSOR_SIZE,16
      env=QT_AUTO_SCREEN_SCALE_FACTOR,1

      # Layout settings
      default_layout=scroller
      incnmaster=1
      mfact=0.55
      scroller_default_proportion=1.0
      scroller_proportion_preset=0.5,1.0
      edge_scroller_pointer_focus=0
      scroller_structs=3

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

      # Floating windows
      windowrule=float,title:Picture in picture
      windowrule=float,appid:mpv
      windowrule=float,appid:pavucontrol
      windowrule=float,appid:blueman-manager
      windowrule=float,title:Open File
      windowrule=float,title:Save File

      # Autostart applications
      exec-once=swaybg -i /home/olegsea/flake/resources/wallpaper.jpeg
      exec-once=dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
      exec-once=noctalia-shell
      exec-once=vivaldi
      exec-once=kitty
      exec-once=spotify
      exec-once=telegram-desktop
      exec-once=discord
      exec-once=throne
    '';
  };
}
