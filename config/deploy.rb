require 'bundler/capistrano'

set :application, "treinolivre.com"
set :repository, "git@github.com:marcellodesouza/treinolivre.git"
set :user, "railsapps"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"
set :scm, :git

server application, :app, :web, :db,  :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true} do
    run "#{try_sudo} touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end

