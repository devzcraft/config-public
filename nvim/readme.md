### npm i -g vscode-langservers-extracted - for html
# config-public

1.
    - git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


 2.
    - git clone --depth=1 https://hub.fastgit.xyz/sumneko/lua-language-server
    - cd lua-language-server
    - git submodule update --init --recursive
    - cd 3rd/luamake
    - ./compile/install.sh
    - cd ../..
    - ./3rd/luamake/luamake rebuild
    - export PATH="${HOME}/.config/lsp/lua-language-server/bin:${PATH}"

3.  StyLua
    - sudo npm install -g @johnnymorganz/stylua-bin

4.
    - sudo apt-get -y install gopls
5.
    - npm i intelephense -g

6.
    - sudo apt install ripgrep 
