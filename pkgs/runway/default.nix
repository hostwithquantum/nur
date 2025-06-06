# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "09sf1j0ka889y8hvgqkysn0bkald0g24vj6z3x8bzg3pdj7sc0k4";
    x86_64-linux = "0rq8sqw3y24jrgfgn9qdaqyh51j2srs021121hq927giv1a54nml";
    aarch64-linux = "0aw1l8p4il1xsgxm2pk33q5m5llng89brz36mj44f6fbfml3ah7a";
    x86_64-darwin = "0ai6imk43l5vv4djz3k3471br5np50jh742szfj4ri0i8c5k1ijs";
    aarch64-darwin = "00x3lyyg9a3cnmplzvc03gnsy9ypz8666ypxrbhssha04mrjg10w";
  };

  urlMap = {
    i686-linux = "https://download.runway.horse/runway/1.16.1/runway_Linux_i386.tar.gz";
    x86_64-linux = "https://download.runway.horse/runway/1.16.1/runway_Linux_x86_64.tar.gz";
    aarch64-linux = "https://download.runway.horse/runway/1.16.1/runway_Linux_arm64.tar.gz";
    x86_64-darwin = "https://download.runway.horse/runway/1.16.1/runway_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://download.runway.horse/runway/1.16.1/runway_Darwin_arm64.tar.gz";
  };
  sourceRootMap = {
    i686-linux = "runway_Linux_i386";
    x86_64-linux = "runway_Linux_x86_64";
    aarch64-linux = "runway_Linux_arm64";
    x86_64-darwin = "runway_Darwin_x86_64";
    aarch64-darwin = "runway_Darwin_arm64";
  };
in
stdenvNoCC.mkDerivation {
  pname = "runway";
  version = "1.16.1";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = sourceRootMap.${system};

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./runway $out/bin/runway
  '';

  system = system;

  meta = {
    description = "The runway CLI.";
    homepage = "https://runway.planetary-quantum.com/";
    license = lib.licenses.unfree;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
