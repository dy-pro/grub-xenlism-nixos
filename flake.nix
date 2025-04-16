{
  description = "Xenlism GRUB theme for NixOS";

  outputs = { self, nixpkgs }: {
    packages = nixpkgs.lib.genAttrs ["x86_64-linux"] (system: {
      default = nixpkgs.legacyPackages.${system}.callPackage ./default.nix {};
    });
  };
}
