module DataMigration
  module Rails

    class Railtie < ::Rails::Railtie
      rake_tasks do
        load 'tasks/data_migration.rake'
      end
    end
  end
end
