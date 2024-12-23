if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias pn=pnpm

# Created by `pipx` on 2023-12-01 04:38:22
set PATH $PATH ~/.local/bin

# cargo
set PATH $PATH ~/.cargo/bin/ ~/.npm-global/bin

# volta
set VOLTA_HOME $HOME/.volta
set PATH $PATH $VOLTA_HOME/bin

# turso
set PATH $PATH ~/.turso/

# nvidia cuda
set NVCC_CCBIN '/usr/bin/g++-13'
set CUDA_PATH /opt/cuda

set PATH $PATH '/opt/cuda/bin' '/opt/cuda/nsight_compute' '/opt/cuda/nsight_systems/bin'
