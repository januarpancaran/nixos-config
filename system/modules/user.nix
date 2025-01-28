let
  user = "yuhshi";
in 
{
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
  };

  services.getty.autologinUser = user;
}
