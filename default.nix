{ stdenv }:

stdenv.mkDerivation {
  pname = "xenlism-grub-theme";
  version = "1.0";
  src = ./xenlism-grub-1080p-nixos/Xenlism-Nixos;

  installPhase = ''
    mkdir -p $out/grub/themes
    cp -r $src $out/grub/themes/xenlism
  '';
}

