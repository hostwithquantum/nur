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
    i686-linux = "03wlljzcdwp5pvgfgjx0nvgcyvqx1sahzz0gcypz27w2f4zchbd5";
    x86_64-linux = "0wzkg0qqg00h0a78prlnhrvp0w4gmdb34h3f7hyb08mp0izcd9l3";
    aarch64-linux = "0hk6vw6zskfix0jllg2jwjj04dvawcs8pqwnvwkj8m1k9b9n5fja";
    x86_64-darwin = "1980iwlwh31vin58zriykkflxp0h9ym0z36k3dsba38crq4b5pkm";
    aarch64-darwin = "0lf26dnz1kljiaknvdwj34570w234g7zzqdfaps4fcyqx165bg9k";
  };

  urlMap = {
    i686-linux = "https://download.runway.horse/runway/1.17.0/runway_Linux_i386.tar.gz";
    x86_64-linux = "https://download.runway.horse/runway/1.17.0/runway_Linux_x86_64.tar.gz";
    aarch64-linux = "https://download.runway.horse/runway/1.17.0/runway_Linux_arm64.tar.gz";
    x86_64-darwin = "https://download.runway.horse/runway/1.17.0/runway_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://download.runway.horse/runway/1.17.0/runway_Darwin_arm64.tar.gz";
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
  version = "1.17.0";
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
