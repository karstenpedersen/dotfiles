# dotfiles

My personal dotfiles.

## Get Started

```bash
# Setup
just init <host>
just rebuild

# Rebuild
just rebuild
```

### Setup SOPS

```bash
mkdir -p ~/.config/sops/age
age-keygen -o ~/.config/sops/age/keys.txt
# nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"

# Get public key
age-keygen -y ~/.config/sops/age/keys.txt
```
