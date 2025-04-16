{ stdenv }:

stdenv.mkDerivation {
  pname = "xenlism-grub-theme";
  version = "1.0";
  src = ./.;

  installPhase = ''
    mkdir -p $out/grub/themes/xenlism
    cp -r ./Xenlism-Nixos/. $out/grub/themes/xenlism
  '';
}
