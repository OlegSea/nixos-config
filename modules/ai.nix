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

      # Values pointing at existing files are read at gateway startup
      # (trailing newlines from agenix are stripped)
      environment = {
        AI_BASE_URL = config.age.secrets.ai-endpoint.path;
        AI_API_KEY = config.age.secrets.ai-token.path;
        # Loopback-only Control UI auth; consider a dedicated secret eventually
        OPENCLAW_GATEWAY_TOKEN = config.age.secrets.ai-token.path;
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
                id = "claude-opus-5.5";
                name = "claude-opus-5.5";
              }
            ];
          };
        };

        agents.defaults.model.primary = "ai/claude-opus-5.5"; # TODO: keep in sync with the model above
      };
    };
  };
}
