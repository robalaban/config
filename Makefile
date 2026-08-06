.PHONY: rebuild clean upgrade update

# Auto-detected from the machine name (personal = robert, work = robert-work).
# One-time bootstrap on the work machine before it's renamed: `make rebuild HOST=robert-work`
HOST ?= $(shell scutil --get LocalHostName)

rebuild:
	nix build .#darwinConfigurations.$(HOST).system
	sudo ./result/sw/bin/darwin-rebuild switch --flake .#$(HOST)

clean:
	nix-collect-garbage -d

upgrade:
	sudo -i nix upgrade-nix

update:
	nix flake update
