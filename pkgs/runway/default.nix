# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, pkgs
, lib
, fetchurl
, installShellFiles
}:
let
  shaMap = {
    i686-linux = "1kl47kdwwj2xgx1bsg27rla8ibk0idyjg1m80762f5ldqprb02j5";
    x86_64-linux = "05rw7bpq5rgrx9h7mbvv2sx6gggndmjdi900ajhn5j3v2m4dhaql";
    aarch64-linux = "1m3ygw0l50qgdj7m26dwdxmiy8d8ljns10kkq7cy3ldn423jqbg0";
    x86_64-darwin = "10a4sj58vl1f337pivvpfi47i0wz9jg3ds8habcw9b16k5md5i10";
    aarch64-darwin = "0v52qdi6wmrjabwnnddb452m1w0my4n7n0j012mwmpf2wnbgixp3";
  };

  urlMap = {
    i686-linux = "https://download.runway.horse/runway/1.3.7/runway_Linux_i386.tar.gz";
    x86_64-linux = "https://download.runway.horse/runway/1.3.7/runway_Linux_x86_64.tar.gz";
    aarch64-linux = "https://download.runway.horse/runway/1.3.7/runway_Linux_arm64.tar.gz";
    x86_64-darwin = "https://download.runway.horse/runway/1.3.7/runway_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://download.runway.horse/runway/1.3.7/runway_Darwin_arm64.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "runway";
  version = "1.3.7";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = "runway_Darwin_x86_64";

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

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
