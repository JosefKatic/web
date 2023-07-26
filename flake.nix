{
  description = "Personal website joka00.dev ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, gitignore, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        nodejs = pkgs.nodejs_20;
        appBuild = pkgs.stdenv.mkDerivation {
          name = "joka00_web";
          src = gitignore.lib.gitignoreSource ./.;
          buildInputs = [
            nodejs
            pkgs.nodePackages.tailwindcss
          ];
          buildPhase = ''
            rm -rf ./public/*
            tailwindcss -i ./src/input.css -o ./public/styles.css --minify
            cp ./src/index.html ./public
            cp -r ./src/assets ./public/
          '';
          installPhase = ''
            mkdir -p $out/public
            cp -r ./public/* $out/public
          '';
        };
      in with pkgs; {
        defaultPackage = appBuild;
        devShell = mkShell { 
          buildInputs = [ 
            nodejs
            nodePackages.tailwindcss
          ]; 
        };
      });
}