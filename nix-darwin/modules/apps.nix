{ pkgs, ... }:
{

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  # TODO Fell free to modify this file to fit your needs.
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment = {
    systemPackages = with pkgs; [
      chezmoi
      fastfetch
      btop
      ripgrep
      fd
      fzf
      dwt1-shell-color-scripts
      bat
      oh-my-zsh
      pkg-config
      apple-sdk

      # editors
      vim
      neovim

      # version control
      git
      lazygit
      gh

      # language servers
      nil

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
      rust-analyzer

      #dotnet
      dotnet-sdk
    ];

    # variables = {
    #   # libinv rust environment fix
    #   LIBRARY_PATH = "${pkgs.libiconv}/lib";
    #   RUSTFLAGS = "-L ${pkgs.libiconv}/lib";
    #   PKG_CONFIG_PATH = "${pkgs.libiconv}/lib/pkgconfig";
    # };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.blex-mono
    font-awesome
  ];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      cleanup = "zap";
    };

    taps = [
      "nikitabobko/tap"
    ];

    # `brew install`
    brews = [
    ];

    # `brew install --cask`
    casks = [
      "firefox"
      "discord"
      "kitty"
      "aerospace"
      "android-file-transfer"
      "visual-studio-code"
      "spotify"
      "claude"
      "notchnook"
      "qutebrowser"
    ];
  };
}
