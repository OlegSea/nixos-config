{
  pkgs,
  llama-cpp,
  nix-openclaw,
  config,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    lmstudio
    # (pkgs.callPackage ../packages/llamacpp.nix { })
    llama-cpp.packages.${pkgs.stdenv.hostPlatform.system}.cuda
  ];
  networking.firewall.allowedTCPPorts = [
    1234
  ];
  networking.firewall.allowedUDPPorts = [
    1234
  ];

  # OpenClaw gateway runs as a user service, so it needs to read the secrets itself
  age.secrets.ai-endpoint = {
    owner = "olegsea";
    group = "wheel";
  };
  age.secrets.ai-token = {
    owner = "olegsea";
    group = "wheel";
  };

  nixpkgs.overlays = [ nix-openclaw.overlays.default ];

  # Desktop access: ydotoold provides mouse/keyboard injection via uinput
  programs.ydotool.enable = true;
  users.users.olegsea.extraGroups = [ config.programs.ydotool.group ];

  hm = {
    imports = [ nix-openclaw.homeManagerModules.openclaw ];

    programs.openclaw = {
      enable = true;

      # NOTE: all bundled plugins are sourced from nix-openclaw-tools
      # subflakes whose committed locks contain path-type entries
      # ("root": "../.."). Lix (unlike CppNix) rejects those with
      # "lock file contains mutable lock". Keep them all off until
      # upstream fixes the tool flake locks.
      bundledPlugins = {
        summarize.enable = false; # Summarize web pages, PDFs, videos
        peekaboo.enable = false; # Take screenshots
        poltergeist.enable = false; # File watching and automation
        sag.enable = false; # Text-to-speech
        gogcli.enable = false; # Google Workspace CLI
        goplaces.enable = false; # Google Places API
        sonoscli.enable = false; # Sonos control
      };

      # Desktop access on Wayland/niri (peekaboo is macOS-only)
      runtimePackages = with pkgs; [
        grim # screenshots
        slurp # region selection
        wtype # keyboard input via virtual-keyboard protocol
        ydotool # mouse input (talks to ydotoold)
        wl-clipboard # wl-copy / wl-paste
        libnotify # notify-send
        niri # niri msg: windows, workspaces, focus
        xdg-utils # xdg-open
      ];

      skills = [
        {
          name = "desktop";
          description = "See and control the user's Wayland (niri) desktop: screenshots, windows, keyboard, mouse, clipboard";
          mode = "inline";
          body = ''
            # Desktop control (niri / Wayland)

            All commands run on the user's live desktop session.

            ## Look
            - Full screenshot: `grim /tmp/openclaw-shot.png`, then read the image file
            - Single output: `grim -o <output> /tmp/openclaw-shot.png` (list outputs with `niri msg outputs`)
            - Region: `grim -g "X,Y WxH" /tmp/openclaw-shot.png`
            - Focused window: `niri msg -j focused-window`

            ## Windows / workspaces
            - List: `niri msg -j windows`, `niri msg -j workspaces`
            - Focus: `niri msg action focus-window --id <id>`
            - Launch app: `niri msg action spawn -- <cmd> [args]`
            - Close focused: `niri msg action close-window`
            - Open URL/file: `xdg-open <target>`

            ## Keyboard
            - Type text: `wtype 'hello world'`
            - Key combo: `wtype -M ctrl -k l -m ctrl` (press mod, key, release mod)
            - Single key: `wtype -k Return`

            ## Mouse (ydotool)
            - Move: `ydotool mousemove --absolute -x <X> -y <Y>`
            - Left click: `ydotool click 0xC0`; right: `0xC1`; middle: `0xC2`
            - Scroll: `ydotool mousemove --wheel -x 0 -y -3`

            ## Clipboard / notifications
            - `wl-paste`, `echo text | wl-copy`
            - `notify-send "title" "body"`

            ## Rules
            - Take a screenshot before and after acting to verify the result.
            - Never type passwords or confirm purchases, deletions, or messages without asking the user first.
          '';
        }
      ];

      # Values pointing at existing files are read at gateway startup
      # (trailing newlines from agenix are stripped)
      environment = {
        AI_BASE_URL = config.age.secrets.ai-endpoint.path;
        AI_API_KEY = config.age.secrets.ai-token.path;
        # Loopback-only Control UI auth; consider a dedicated secret eventually
        OPENCLAW_GATEWAY_TOKEN = config.age.secrets.ai-token.path;
        YDOTOOL_SOCKET = config.environment.variables.YDOTOOL_SOCKET;
      };

      config = {
        gateway.mode = "local";

        models = {
          mode = "merge";
          providers.ai = {
            baseUrl = "\${AI_BASE_URL}";
            apiKey = {
              source = "env";
              provider = "default";
              id = "AI_API_KEY";
            };
            # Use "anthropic-messages" instead if your endpoint is Anthropic-compatible
            api = "openai-completions";
            models = [
              {
                # TODO: replace with a real model id served by your endpoint
                # (check with: curl -H "Authorization: Bearer $(sudo cat /run/agenix/ai-token)" $(sudo cat /run/agenix/ai-endpoint)/models)
                id = "deepseek-v4.1-flash";
                name = "deepseek-v4.1-flash";
              }
            ];
          };
        };

        # Run shell commands on the host (needed for the desktop skill),
        # asking for approval on anything not yet allowlisted
        tools.exec = {
          host = "gateway";
          ask = "on-miss";
        };

        agents.defaults.model.primary = "ai/deepseek-v4.1-flash"; # TODO: keep in sync with the model above
      };
    };

    # Start with the graphical session so WAYLAND_DISPLAY / NIRI_SOCKET
    # (imported by niri-session) are present in the gateway environment
    systemd.user.services.openclaw-gateway = {
      Unit = {
        After = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
      };
      Install.WantedBy = [ "graphical-session.target" ];
    };
  };
}
