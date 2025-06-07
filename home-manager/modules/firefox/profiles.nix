{
  programs.firefox.profiles = let
    user = "daangsangu";
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
