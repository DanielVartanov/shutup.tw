namespace :rails do
  desc "Remote console"
  task :console do
    on roles(:app), primary: true do
      rails_env = fetch(:stage)
      run_interactively "bundle exec rails console #{rails_env}"
    end
  end

  desc "Remote dbconsole"
  task :dbconsole do
    on roles(:app) do |host|
      rails_env = fetch(:stage)
      run_interactively "bundle exec rails dbconsole #{rails_env}"
    end
  end

  def run_interactively(command, server=nil)
    exec %Q(ssh -l #{fetch(:deploy_user)} #{host} -t 'bash -l -c "cd #{current_path} && #{command}"')
  end
end
