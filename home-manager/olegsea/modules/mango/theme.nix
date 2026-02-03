{ pkgs, ... }:
{
  wayland.windowManager.mango = {
    settings = ''
      #### MangoWC Theme Configuration ####

      # Visual settings - based on niri/hyprland appearance
      # Dimensions (matching niri gaps)
      gappih=8
      gappiv=8
      gappoh=16
      gappov=16
      borderpx=3

      # Colors (matching niri/hyprland color scheme)
      rootcolor=0x1d2021ff
      bordercolor=0x505050ff
      focuscolor=0xebdbb2ff
      urgentcolor=0x9b0000ff

      # State-specific colors
      maximizescreencolor=0x89aa61ff
      scratchpadcolor=0x516c93ff
      globalcolor=0xb153a7ff
      overlaycolor=0x14a57cff

      # Cursor theme (matching niri settings)
      cursor_size=16
      cursor_theme=Adwaita

      # Window effects
      shadows=1
      layer_shadows=1
      shadow_only_floating=0
      shadows_size=5
      shadows_blur=5
      shadows_position_x=0
      shadows_position_y=5
      shadowscolor=0x00000070

      # Corner radius and opacity
      border_radius=10
      no_radius_when_single=0
      focused_opacity=1.0
      unfocused_opacity=1.0

      # Blur effects (optional - can be resource intensive)
      blur=0
      blur_layer=0
      blur_optimized=1
      blur_params_radius=3
      blur_params_num_passes=1
      blur_params_noise=0.02
      blur_params_brightness=0.9
      blur_params_contrast=0.9
      blur_params_saturation=1.2

      # Scratchpad appearance
      scratchpad_width_ratio=0.8
      scratchpad_height_ratio=0.9

      # Tag animation direction (1=horizontal, 0=vertical)
      tag_animation_direction=0
    '';
  };
}
