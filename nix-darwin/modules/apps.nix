{ pkgs, ... }:
{

  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: You can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # The packages installed here are available to all users, and are reproducible across machines, and are rollbackable.
  # But on macOS, it's less stable than homebrew.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331
  environment = {
    # PACKAGES
    systemPackages = with pkgs; [
      # gui apps
      # qutebrowser
      # yabai

      # misc
      chezmoi
      fastfetch
      btop
      ripgrep
      fd
      fzf
      bat
      direnv
      pastel
      caligula
      tmux
      zellij
      exercism
      tree
      codecrafters-cli
      claude-code
      inetutils

      # ani-cli
      ani-cli
      iina
      aria2
      yt-dlp

      # shell
      starship
      oh-my-zsh
      dwt1-shell-color-scripts

      # editors
      vim
      neovim

      # version control
      git
      lazygit
      gh

      # language servers
      nil

      # c/c++
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
      rustfmt
      clippy

      # haskell
      cabal-install
      ghc
      stack

      # dotnet
      dotnetCorePackages.dotnet_9.sdk
      mono
      msbuild
      roslyn-ls
      fsautocomplete
      # omnisharp-roslyn

      # database
      sqlite

      # libraries
      # darwin.libiconv
      # darwin.libiconv.out
      # darwin.libiconv.dev
    ];

    variables = {
      # libiconv fix on macOS
      RUSTFLAGS = "-L ${pkgs.libiconv}/lib";
      LIBRARY_PATH = "${pkgs.libiconv}/lib";
      PKG_CONFIG_PATH = "${pkgs.libiconv}/lib/pkgconfig";
    };
  };

  # PROGRAM OPTIONS
  programs = {
    fish = {
      enable = true;
      package = pkgs.fish.overrideAttrs (oldAttrs: {
        doCheck = false;
      });
      vendor = {
        functions.enable = true;
        completions.enable = true;
        config.enable = true;
      };
    };
  };

  # FONTS
  fonts.packages = with pkgs; [
    nerd-fonts.blex-mono
    font-awesome
  ];

  # HOMEBREW
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
      "mit-scheme"
      "pkg-config"
      "openssl"
    ];

    # `brew install --cask`
    casks = [
      "discord"
      "wezterm"
      "ghostty"
      "cool-retro-term"
      "firefox"
      "aerospace"
      "android-file-transfer"
      "visual-studio-code"
      "spotify"
      "claude"
      "notchnook"
      "keyboardcleantool"
      "raycast"
      "skim"
      "obsidian"
      "windows-app"
      "steam"
      "kindavim"
      "insomnia"
      "microsoft-teams"
      "microsoft-outlook"
      "microsoft-excel"
      "slack"
      "unetbootin"
      "bitwarden"
      "vcv-rack"
      "docker"
      "docker-desktop"
      "parallels"
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      # "dotnet-sdk-6.0.428"
    ];
  };

  nixpkgs.overlays = [
    (final: prev: {
      fish = prev.fish.overrideAttrs (oldAttrs: {
        doCheck = false;
      });
    })
  ];

}
