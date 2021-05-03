{
  pkgs ? import <nixpkgs> {}
  # (fetchTarball "https://github.com/NixOS/nixpkgs-channels/archive/b58ada326aa612ea1e2fb9a53d550999e94f1985.tar.gz") {}
}:
pkgs.stdenv.mkDerivation rec {
  pname = "chord";
  version = "0.1.0";

  # rev = "cbe903e7f8839794fbe572ea4c811e2c802a4038";
  # src = pkgs.fetchurl {
  #   url = "https://gitlab.inria.fr/nix-tutorial/chord-tuto-nix-2019/-/archive/${rev}/chord-tuto-nix-2019-${rev}.tar.gz";
  #   sha256 = "1d75ad63llkcgs2y44fsfismg0n6srlzx3n8fy9v07550jnhwh1c";
  # };
  src = ./.;

  myGhc = pkgs.haskellPackages.ghc;

  buildInputs = [
    # pkgs.simgrid
    # pkgs.boost
    # pkgs.cmake
    myGhc
    # pkgs.ghc
  ];

  configurePhase = ''
    echo My Configuration Phase.
    ghc --version
  '';

  buildPhase = ''
    ghc -o main HelloWorld.hs
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp main $out/bin
  '';
}
