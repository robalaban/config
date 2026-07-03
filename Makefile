.PHONY: rebuild clean upgrade update

rebuild:
	nix build .#darwinConfigurations.robert.system
	sudo ./result/sw/bin/darwin-rebuild switch --flake .#robert

clean:
	nix-collect-garbage -d

upgrade:
	sudo -i nix upgrade-nix

update:
	nix flake update
