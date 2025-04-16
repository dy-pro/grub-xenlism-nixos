# grub-xenlism-nixos

🎨 A GRUB theme for NixOS using the beautiful Xenlism theme, with a custom Nix flake wrapper.

Original theme by [Xenlism](https://github.com/xenlism).

## Usage

Add this to your `flake.nix` inputs:

```nix
inputs.grub-xenlism.url = "github:dy-pro/grub-xenlism-nixos";


#### Then in your NixOS configuration:

```nix
boot.loader.grub = {
  enable = true;
  theme = "${inputs.grub-xenlism.packages.${system}.default}/grub/themes/xenlism";
};

#### `flake.nix`
```nix
{
  description = "Xenlism GRUB theme packaged for NixOS flakes";

  outputs = { self }: {
    packages.x86_64-linux.default = import ./default.nix;
  };
}

