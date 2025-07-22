deploy:
	nix build .#darwinConfigurations.cymac.system \
	   --extra-experimental-features 'nix-command flakes'

	./result/sw/bin/darwin-rebuild switch --flake .#cymac
