desc 'Invoke a rake command on the remote server'
task :invoke => 'deploy:set_rails_env' do |task, args|
  on primary(:app) do
    within current_path do
      with :rails_env => fetch(:rails_env) do
        rake ENV['task']
      end
    end
  end
end