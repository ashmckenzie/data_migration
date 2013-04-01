namespace :db do

  desc 'Performs data migrations'
  task :data_migrate => :environment do
    DataMigration::Migrations.new.process_migrations!
  end

  namespace :data_migrate do

    desc 'Displays current state of data migrations'
    task :status => :environment do
      DataMigration::Migrations.new.display_status
    end

    desc 'Rolls the schema back to the previous version (supports STEP=n or VERSION=n)'
    task :rollback => :environment do
      if ENV['STEP']
        DataMigration::Migrations.new.rollback_migrations!(ENV['STEP'].to_i)
      elsif ENV['VERSION']
        DataMigration::Migrations.new.rollback_migration!(ENV['VERSION'])
      end
    end
  end
end
