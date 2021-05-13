{
  pkgs ? import <nixpkgs> {}
  # (fetchTarball "https://github.com/NixOS/nixpkgs-channels/archive/b58ada326aa612ea1e2fb9a53d550999e94f1985.tar.gz") {}
}:
pkgs.stdenv.mkDerivation rec {
  pname = "chord";
  version = "0.1.0";

  src = ./.;

  myGhc = pkgs.haskellPackages.ghc.overrideAttrs (oldAttrs: rec {
    patches = oldAttrs.patches ++ [ ./trace-linker14.patch ];
  });

  buildInputs = [
    myGhc
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
