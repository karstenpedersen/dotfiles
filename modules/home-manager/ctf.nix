{ pkgs, ... }:

pkgs.buildFHSEnv {
  name = "ctf-env";
  runScript = "bash";
  # runScript = pkgs.writeScript "ctf-env-inner" ''
  #   #!${pkgs.bash}/bin/bash

  #   set -eu -o pipefail

  #   if [ $# -ne 0 ]; then
  #     exec "$@"
  #   else
  #     exec "$SHELL"
  #   fi
  # '';
  targetPkgs = pkgs: (with pkgs; [
    toybox
    binutils
    gnumake
    man-pages
    nmap
    file
    exiftool
    # chepy

    # Executables
    gdb
    checksec
    patchelf
    capstone
    tig

    # Data recovery
    scalpel
    testdisk
    ddrescue

    wireshark
    tshark
    hcxtools
    hexdump
    xxd
    hexedit
    binwalk

    openssl
    age

    # Password cracking
    john
    hashcat
    hashcat-utils

    # Web
    dirb
    burpsuite

    # Steganography
    stegseek
    steghide
    # stegsolve
    pngcheck

    # EWCF
    libewf

    jq
    yq

    # Reverse engineering
    ghidra

    gobuster
    one_gadget
    ropgadget

    # Virtualization
    docker
    virtualbox

    bvi
    ltrace
    nasm
    fasm
    # pwndbg
    # pwninit
    socat
    strace
    
  ]);
  multiPkgs = pkgs: (with pkgs; [
    libseccomp
    curl
    openssl
    fontconfig
    freetype
    glib
    xorg.libICE
    xorg.libSM
    xorg.libX11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    xorg.libXext
    xorg.libXrender
    xorg.libXft
    openal
    SDL
    gtk3
    gtk3-x11
    libGL
    zlib
    dotnet-runtime
    libpng12
    SDL2
    fuse
  ]);
}
