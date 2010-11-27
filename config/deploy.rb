set :application, "blog"
set :repository, "git@github.com:schowdhury/blog.git"
set :deploy_to,     "/var/www/rails/#{application}"
set :rake, 'rake'
set :user, 'deploy'
set :use_sudo, false
set :scm, :git
set :scm_user, 'schowdhury'
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "sameerchowdhury.com"                          # Your HTTP server, Apache/etc
role :app, "sameerchowdhury.com"                          # This may be the same as your `Web` server
role :db,  "sameerchowdhury.com", :primary => true # This is where Rails migrations will run
role :db,  "sameerchowdhury.com"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end
