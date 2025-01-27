if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt -d "Prompt configuration"
    echo (set_color $fish_color_cwd)(basename $PWD)(set_color normal) "\$ "
end

set PATH ~/.local/bin $PATH

set -xg VERILATOR_VERSION 4.210
set -xg VERIBLE_VERSION v0.0-3795-gf4d72375

set PATH ~/tools/verilator/{$VERILATOR_VERSION}/bin $PATH
set PATH ~/tools/verible/{$VERIBLE_VERSION}/bin $PATH

set -xg REPO_TOP ~/opentitan
set -xg TOOLCHAIN_PATH ~/tools/riscv

alias l="ls -la --color"
alias ..="cd .."
