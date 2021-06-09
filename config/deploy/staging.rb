set :branch, ENV.fetch('BRANCH', 'main')
set :stage, :staging
set :rails_env, :staging
set :puma_env, :staging

server ENV['SERVER_IP'], user: 'deploy', roles: %w{web app db}
