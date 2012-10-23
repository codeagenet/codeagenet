# Path to deploy folder is calculated based on appication name:
# "/home/#{application}/app/"

#set rails environment here
set :rails_env, "production"

#set git branch here
set :branch, "master"

#set server address here
set :domain, "codeage@codeage.net" # Required for ssh deploy
set :port, 2228

role :resque_worker, domain
role :resque_scheduler, domain

#Server roles
role :web, domain
role :app, domain
role :db,  domain, :primary => true
