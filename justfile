HOST_FILE := './ignored/host'

# displays help menu
default:
	@just --list

# init
init host='':
	scripts/init.sh {{host}} {{HOST_FILE}}

# rebuild flake
rebuild:
	scripts/rebuild.sh {{HOST_FILE}}

# update flake
update:
	nix flake update

# see diffs made to flake.lock
diff:
	git diff ':!flake.lock'
