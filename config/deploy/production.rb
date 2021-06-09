set :branch, ENV.fetch('BRANCH', 'main')
set :stage, :production
set :rails_env, :production
set :puma_env, :production

server ENV['SERVER_IP'], user: 'deploy', roles: %w{web app db}
