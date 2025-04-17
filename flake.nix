{
  description = "Xenlism GRUB theme for NixOS";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    theme = pkgs.stdenv.mkDerivation {
      name = "xenlism-theme";
      src = ./.;
      installPhase = ''
        mkdir -p $out/grub/themes
        cp -r xenlism $out/grub/themes/
      '';
    };
  in {
    packages.${system}.default = theme;
      
    nixosModules.default = { config, lib, ... }: {
      config = {
        boot.loader.grub = {
          extraFiles = {
            "grub/themes/xenlism/theme.txt" = "${theme}/grub/themes/xenlism/theme.txt";
            "grub/themes/xenlism/background.png" = "${theme}/grub/themes/xenlism/background.png";
          };
          theme = "/grub/themes/xenlism/theme.txt";
        };
      };
    };
  };
}
