# grub-xenlism-nixos

🎨 A GRUB theme for NixOS using the beautiful Xenlism theme.

Original theme by [Xenlism](https://github.com/xenlism).

## Usage

Clone this repo to your project theme. Example: /etc/nixos/themes/xenlism

Then in your NixOS configuration:

```nix
{ inputs, config, grub-theme, ... }:

boot.loader.grub = {
  enable = true;
  theme = "${grub-theme}/grub/themes/xenlism";
};
```
### `/etc/nixos/flake.nix`

```nix
{
  description = "Xenlism GRUB theme packaged for NixOS";

  outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations.yourHost = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        grub-theme = import ./themes/xenlism { 
	 inherit (pkgs) stdenv; 
        };
      };

      modules = [
        ./configuration.nix
      ];
    };
  };
}
```
