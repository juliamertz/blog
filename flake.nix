{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = nixpkgs.lib.systems.flakeExposed;

      perSystem =
        {
          config,
          pkgs,
          lib,
          system,
          ...
        }:
        let
          inherit (config) packages;
          inherit (pkgs) stdenvNoCC writeShellScriptBin;
        in
        {
          packages.public = stdenvNoCC.mkDerivation {
            name = "static-blog";
            src = ./.;
            nativeBuildInputs = with pkgs; [ zola ];
            buildPhase = ''
              zola build -o $out
            '';
          };

          packages.server = writeShellScriptBin "static-blog-server" ''
            ${lib.getExe pkgs.static-web-server} --port 6969 --root ${packages.public}
          '';

          devShells.default = pkgs.mkShell {
            name = "dev-shell";
            packages = with pkgs; [
              zola
              nodejs
              typescript
              nodePackages.prettier
            ];
          };

        };
    };
}
