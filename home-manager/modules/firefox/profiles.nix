let
  user = "yuhshi";
in {
  programs.firefox.profiles = {
    ${user} = {
      id = 0;
      name = "${user}";
      isDefault = true;

      search = {
        force = true;
        default = "Google";
        order = ["Google" "DuckDuckGo"];
      };
    };
  };
}
