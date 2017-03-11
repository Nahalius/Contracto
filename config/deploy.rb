# config valid only for current version of Capistrano
lock '3.4.0'

set :application,     'contracto'
set :deploy_to,       "/home/deployer/apps/#{fetch(:application)}"
set :rails_env,       'production'

# Git settings
set :scm,             :git
set :repo_url,        'git@bitbucket.org:WealthOZ/contracto.git'
set :branch,          'master'

# Additional options
set :format,          :pretty
set :log_level,       :debug
set :pty,             true
set :keep_releases,   5

# Shared files
set :linked_files,    %w{config/database.yml config/secrets.yml}
set :linked_dirs,     %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
