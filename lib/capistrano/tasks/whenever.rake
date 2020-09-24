namespace :load do
  task :defaults do
    set :whenever_roles,        -> { :db }
    set :whenever_command,      -> { [:bundle, :exec, :whenever] }
    set :whenever_command_environment_variables, -> { fetch(:default_env).merge(rails_env: fetch(:whenever_environment)) }
    set :whenever_identifier,   -> { fetch :application }
    set :whenever_environment,  -> { fetch :rails_env, fetch(:stage, "production") }
    set :whenever_variables,    -> { "environment=#{fetch :whenever_environment}" }
    set :whenever_load_file,    -> { nil }
    set :whenever_update_flags, -> { "--update-crontab #{fetch :whenever_identifier} --set #{fetch :whenever_variables}" }
    set :whenever_clear_flags,  -> { "--clear-crontab #{fetch :whenever_identifier}" }
    set :whenever_path,         -> { release_path }
  end
end
