require 'simple-rails-deploy/common'

#Use rvm with ruby 1.9.3 for deployment
load 'deploy/rvm'
#Use unicorn as web server
load 'deploy/unicorn'
#Uncomment if you want to add 'deny all' robots.txt
#load 'deploy/robots-deny-all'

#multistaging
require "capistrano/ext/multistage"
set :stages, %w(production)
set :default_stage, "production"
set :keep_releases, 5

set :application, "codeage"
set :repository,  "git@github.com:codeagenet/codeagenet.git"

require "capistrano-resque"

set :workers, { "realtime" => 2, "realtime,cron" => 1 }

after "deploy:restart", "resque:restart"
after "deploy:restart", "resque:scheduler:restart"

set :normal_symlinks, %w{
   config/database.yml
   tmp
   config/environments/production.rb
}
