{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.Name = "Alex Trifonov";
      user.Email = "ta.alexashow@ya.ru";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
}
