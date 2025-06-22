HOST_FILE := './ignored/host'

# display help menu
default:
	@just --list

# initialize dotfiles
init host='':
	@scripts/init.sh {{host}} {{HOST_FILE}}

# rebuild flake
rebuild:
	@scripts/rebuild.sh {{HOST_FILE}}

# test flake
test:
	@scripts/test.sh {{HOST_FILE}}

# update flake
update:
	@nix flake update

# build iso image
iso:
	@nix build .#nixosConfigurations.iso.config.system.build.isoImage

# see diffs made to flake.lock
diff:
	@git diff ':!flake.lock'
