require 'data_migration/base'
require 'data_migration/migration'
require 'data_migration/migrations'
require 'data_migration/generators/base'
require 'data_migration/generators/install'
require 'data_migration/generators/new'
require 'data_migration/version'

module DataMigration
  require 'data_migration/railtie' if defined?(Rails)

  DB_MIGRATIONS_PATH = 'db/migrate'
  DATA_MIGRATIONS_PATH = 'db/data_migrations'
end
