**This repo is supposed to be used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!


### Run mason in blocking fashion if there are no UIs attached (i.e. running in headless mode): 

```nvim --headless -c "MasonInstall lua-language-server xmlformatter csharpier prettier stylua bicep-lsp html-lsp css-lsp eslint-lsp typescript-language-server json-lsp rust-analyzer roslyn rzls" -c "qall"```

## or with mason inside nvim

``` :MasonInstall lua-language-server xmlformatter csharpier prettier stylua bicep-lsp html-lsp css-lsp eslint-lsp typescript-language-server json-lsp rust-analyzer roslyn rzls ``` 
