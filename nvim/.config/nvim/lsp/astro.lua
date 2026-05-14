---@brief
---
--- https://github.com/withastro/language-tools/tree/main/packages/language-server
---
--- `astro-ls` can be installed via `npm`:
--- ```sh
--- npm install -g @astrojs/language-server
--- ```
---
--- If typescript is installed globally, you might get the `\`typescript.tsdk\` init option is required` error.
--- You will need to manually pass the typescript SDK path. Here is an example of a Nix configuration where typescript is installed via Nix's Home-manager:
---
--- ```nix
--- { config, pkgs, ... }:
---
--- {
---   home.packages = with pkgs; [
---     typescript
---   ];
---
---   programs.neovim = {
---     plugins = with pkgs.vimPlugins; [
---       nvim-lspconfig
---     ];
---     extraPackages = with pkgs; [
---       astro-language-server
---     ];
---     initLua = ''
---       vim.lsp.config['astro'] = {
---         init_options = {
---           typescript = {
---             tsdk = ${pkgs.typescript}/lib/node_modules/typescript/lib,
---           },
---         },
---       }
---
---       vim.lsp.enable('astro')
---
---       -- ...
---     '';
---   };
--- }
--- ```
--- The path can also be passed via a variable, like `vim.g.tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib"` and then used in the Lua Neovim config.

---@type vim.lsp.Config
return {
  init_options = {
    typescript = {
      tsdk = "/home/tao/.local/share/pnpm/global/5/node_modules/typescript/lib"
    },
  },
}
