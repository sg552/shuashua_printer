# -*- encoding : utf-8 -*-
require "bundler/capistrano"
load 'deploy/assets'

set :application, "shuashua_printer"
set :repository, "git://github.com/sg552/shuashua_printer.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.168.1.36"                          # Your HTTP server, Apache/etc
role :app, "192.168.1.36"                          # This may be the same as your `Web` server
role :db,  "192.168.1.36", :primary => true # This is where Rails migrations will run

set :deploy_to, "/apps/shuashua_printer/"
set :user, "sg552"
#ssh_options[:keys] = %w{connectingbj.pem}

namespace :deploy do
  set :use_sudo, true
  task :restart do
    #run "/opt/nginx/sbin/nginx -s reload"
    run "cd #{release_path} && touch tmp/restart.txt"
  end
  task :start do
    run "/opt/nginx/sbin/nginx"
  end
  task :stop do
    run "/opt/nginx/sbin/nginx -s stop"
  end
  namespace :assets do
    task :precompile do
      run "cd #{release_path} && bundle exec rake RAILS_ENV=production RAILS_GROUPS=assets assets:precompile "
    end
  end
end


# store the database.yml and other configuration files in the
# common shared directory and then copy them in to the application
desc "Copy database.yml to release_path"
task :cp_database_yml do
  puts "executing my customized command: "
  puts "cp -r #{shared_path}/config/* #{release_path}/config/"
  run "cp -r #{shared_path}/config/* #{release_path}/config/"
end

before "deploy:assets:symlink", :cp_database_yml

#before "deploy", mongrel::stop
