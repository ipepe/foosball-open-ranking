# Commands
# deploy:initial
# deploy

# Change these
set :repo_url,        'https://github.com/ipepe/foosball-open-ranking'
set :application,     'foos'
set :user,            'webapp'

# Don't change these unless you know what you're doing
set :rbenv_ruby,      '2.3.3'
set :passenger_restart_with_touch, true
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/webapp"
# set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

## Linked Files & Directories (Default None):
# set :linked_files, %w{config/database.yml}
# set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :rbenv do
  desc 'Install rbenv version of project if missing on server'
  task :install_rbenv_if_missing do
    on release_roles(fetch(:rbenv_roles)) do
      unless test "[ -d #{fetch(:rbenv_ruby_dir)} ]"
        execute :rbenv, 'install', fetch(:rbenv_ruby)
        execute :rbenv, 'global', fetch(:rbenv_ruby)
        execute :gem, 'install bundler'
      end
    end
  end
  before :validate, :install_rbenv_if_missing
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end