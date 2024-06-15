{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
      utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in {
          devShell = with pkgs; mkShell {
            buildInputs = with pkgs; [ jdk21 ];

            LD_LIBRARY_PATH = "${pkgs.libGL}/lib:$LD_LIBRARY_PATH";
          };
        }
      );
}