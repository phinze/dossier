namespace :db do
  task :kill_connections => :environment do
    ActiveRecord::Base.configurations.each do |env, config|
      # Skip entries that don't have a database key
      next unless config['database']

      # Only do this to local DBs
      next unless config['host'] == 'localhost' || config['host'].nil?

      # Skip anything that looks like production
      next if env == 'production'

      ActiveRecord::Base.establish_connection(config)
      begin
        ActiveRecord::Base.connection.execute("
          SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname = '#{config['database']}';
        ")
      rescue ActiveRecord::StatementInvalid => e
        # we expect our connection to be terminated; suicide command!
        raise unless e.message =~ /terminating connection due to administrator command/
      end
    end
  end

  Rake::Task['db:drop'].enhance [ 'db:kill_connections' ]

  desc "wipe and rebuild the database"
  task :redo => [:drop, :create, :migrate, :seed] do
  end
end

