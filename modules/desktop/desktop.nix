{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vivaldi
    nemo
    nemo-fileroller
    nemo-preview
    kdePackages.ark
    vlc
    nomacs
    yt-dlp
    qbittorrent
    ffmpeg
    font-manager

    libqalculate
    qalculate-qt
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.ubuntu-mono
    intel-one-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    ibm-plex
  ];

  hm = {
    xdg.mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = "vivaldi-stable.desktop";
        "x-scheme-handler/http" = "vivaldi-stable.desktop";
        "x-scheme-handler/https" = "vivaldi-stable.desktop";
        "x-scheme-handler/about" = "vivaldi-stable.desktop";
        "x-scheme-handler/unknown" = "vivaldi-stable.desktop";

        "inode/directory" = "nemo.desktop";

        "audio/aac" = "vlc.desktop";
        "audio/flac" = "vlc.desktop";
        "audio/mp4" = "vlc.desktop";
        "audio/mpeg" = "vlc.desktop";
        "audio/ogg" = "vlc.desktop";
        "audio/x-matroska" = "vlc.desktop";
        "audio/x-wav" = "vlc.desktop";
        "video/mp4" = "vlc.desktop";
        "video/mpeg" = "vlc.desktop";
        "video/ogg" = "vlc.desktop";
        "video/webm" = "vlc.desktop";
        "video/x-flv" = "vlc.desktop";
        "video/x-matroska" = "vlc.desktop";
        "video/x-msvideo" = "vlc.desktop";

        "application/bzip2" = "org.kde.ark.desktop";
        "application/gzip" = "org.kde.ark.desktop";
        "application/vnd.rar" = "org.kde.ark.desktop";
        "application/x-7z-compressed" = "org.kde.ark.desktop";
        "application/x-bzip2" = "org.kde.ark.desktop";
        "application/x-compressed-tar" = "org.kde.ark.desktop";
        "application/x-gzip" = "org.kde.ark.desktop";
        "application/x-rar" = "org.kde.ark.desktop";
        "application/x-rar-compressed" = "org.kde.ark.desktop";
        "application/x-tar" = "org.kde.ark.desktop";
        "application/x-xz" = "org.kde.ark.desktop";
        "application/zip" = "org.kde.ark.desktop";

        "text/plain" = "dev.zed.Zed.desktop";
        "application/json" = "dev.zed.Zed.desktop";

        "image/bmp" = "org.nomacs.ImageLounge.desktop";
        "image/gif" = "org.nomacs.ImageLounge.desktop";
        "image/jpeg" = "org.nomacs.ImageLounge.desktop";
        "image/png" = "org.nomacs.ImageLounge.desktop";
        "image/svg+xml" = "org.nomacs.ImageLounge.desktop";
        "image/tiff" = "org.nomacs.ImageLounge.desktop";
        "image/webp" = "org.nomacs.ImageLounge.desktop";
        "image/x-icns" = "org.nomacs.ImageLounge.desktop";

        "application/msword" = "onlyoffice-desktopeditors.desktop";
        "application/vnd.openxmlformats-officedocument.wordprocessingml.document" =
          "onlyoffice-desktopeditors.desktop";
        "application/vnd.oasis.opendocument.text" = "onlyoffice-desktopeditors.desktop";
        "application/vnd.ms-powerpoint" = "onlyoffice-desktopeditors.desktop";
        "application/vnd.openxmlformats-officedocument.presentationml.presentation" =
          "onlyoffice-desktopeditors.desktop";
        "application/vnd.oasis.opendocument.presentation" = "onlyoffice-desktopeditors.desktop";
        "application/vnd.ms-excel" = "onlyoffice-desktopeditors.desktop";
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" =
          "onlyoffice-desktopeditors.desktop";
        "application/vnd.oasis.opendocument.spreadsheet" = "onlyoffice-desktopeditors.desktop";
        "application/pdf" = "org.pwmt.zathura.desktop";
      };
    };
  };
}
