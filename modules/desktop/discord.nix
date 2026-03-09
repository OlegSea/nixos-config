{ nixcord, ... }:
{
  hm = {
    imports = [ nixcord.homeModules.nixcord ];

    programs.nixcord = {
      enable = true;
      discord.vencord.enable = true;
      config = {
        themeLinks = [
          "https://raw.githubusercontent.com/shvedes/discord-gruvbox/refs/heads/main/gruvbox-dark.theme.css"
        ];
        frameless = true;
        plugins = {
          fakeNitro.enable = true;
          betterGifPicker.enable = true;
          betterGifAltText.enable = true;
          betterSettings.enable = true;
          BlurNSFW.enable = true;
          ClearURLs.enable = true;
          copyEmojiMarkdown.enable = true;
          copyFileContents.enable = true;
          copyStickerLinks.enable = true;
          CopyUserURLs.enable = true;
          crashHandler.enable = true;
          experiments.enable = true;
          expressionCloner.enable = true;
          favoriteGifSearch.enable = true;
          fixYoutubeEmbeds.enable = true;
          fixSpotifyEmbeds.enable = true;
          fixImagesQuality.enable = true;
          fullSearchContext.enable = true;
          friendsSince.enable = true;
          fullUserInChatbox.enable = true;
          imageLink.enable = true;
          imageZoom.enable = true;
          memberCount.enable = true;
          messageLogger.enable = true;
          MutualGroupDMs.enable = true;
          messageLinkEmbeds.enable = true;
          messageClickActions.enable = true;
          mentionAvatars.enable = true;
          noF1.enable = true;
          noOnboardingDelay.enable = true;
          OnePingPerDM = {
            enable = true;
            allowEveryone = true;
            allowMentions = true;
          };
          openInApp.enable = true;
          permissionFreeWill.enable = true;
          permissionsViewer.enable = true;
          petpet.enable = true;
          quickReply.enable = true;
          quickMention.enable = true;
          reverseImageSearch.enable = true;
          shikiCodeblocks.enable = true;
          serverListIndicators.enable = true;
          showHiddenChannels.enable = true;
          showHiddenThings.enable = true;
          showMeYourName.enable = true;
          showTimeoutDuration.enable = true;
          silentMessageToggle.enable = true;
          sortFriendRequests.enable = true;
          typingTweaks.enable = true;
          unindent.enable = true;
          userVoiceShow.enable = true;
          validUser.enable = true;
          validReply.enable = true;
          viewRaw.enable = true;
          viewIcons.enable = true;
        };
      };
      extraConfig = {
        # Some extra JSON config here
        # ...
      };
    };
  };
}
