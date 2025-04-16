{
  description = "Xenlism GRUB theme for NixOS";

  outputs = { self, nixpkgs }: {
    packages.x86_64-linux.default = 
      let 
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in
        pkgs.stdenv.mkDerivation {
          pname = "xenlism-grub-theme";
          version = "1.0";
          src = ./Xenlism-Nixos;

          installPhase = ''
            mkdir -p $out/grub/themes
            cp -r $src $out/grub/themes/xenlism
          '';
        };
  };
}
