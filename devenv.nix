{ pkgs, ... }: {
  # Docs: https://devenv.sh/basics/
  difftastic.enable = true;

  languages = {
    javascript = {
      enable = true; # source: https://github.com/cachix/devenv/blob/main/src/modules/languages/javascript.nix
      #corepack.enable = true; # shim for npm/yarn/pnpm - https://github.com/nodejs/corepack#readme
      #- but questionable: https://github.com/cachix/devenv/pull/475#issuecomment-1571879078
    };
    nix.enable = true;
  };

  packages = with pkgs; [
    gcc # needed for some npm packages
    # yarn
    # nodePackages.pnpm
  ];

  scripts = {
    # yd.exec = ''yarn dev'';
  };

  pre-commit.hooks = {
    # (i) available pre-configured hooks: https://devenv.sh/reference/options/#pre-commithooks
    eslint = {
      enable = true;
      #? fail_fast = true;
    };

    # (i) external hooks: https://github.com/cachix/pre-commit-hooks.nix/issues/31
  };
}
