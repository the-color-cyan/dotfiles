# development related packages

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # editors
    vim
    neovim

    # version control
    git
    lazygit
    gh

    # C/C++
    gcc
    clang
    cmake

    # python
    python3
    python3Packages.pip
    python3Packages.virtualenv

    # lua
    lua
    luajit
    luarocks

    # javascript
    nodejs

    # rust
    rustc
    cargo
    rustup
  ];
}
