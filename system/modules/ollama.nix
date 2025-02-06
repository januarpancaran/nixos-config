{pkgs, ...}: {
  services.ollama = {
    package = pkgs.ollama;
    enable = true;
    acceleration = "cuda";
  };
}
