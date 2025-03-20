{
  programs.firefox.profiles = let
    user = "yuhshi";
  in {
    ${user} = {
      id = 0;
      name = user;
      isDefault = true;

      search = {
        force = true;
        default = "google";
        order = ["google" "ddg"];
      };
    };
  };
}
