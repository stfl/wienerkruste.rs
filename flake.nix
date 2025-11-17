{
  description = "wienerkruste.rs - Development environment";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1";
    flake-utils.url = "https://flakehub.com/f/numtide/flake-utils/0.1";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Zola static site generator
            zola

            # Nice-to-haves for development
            sass # SCSS compilation (Zola uses libsass internally, but useful for testing)
            nodePackages.prettier # Optional: Format markdown
          ];
        };
      }
    );
}
