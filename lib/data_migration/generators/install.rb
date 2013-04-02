module DataMigration
  module Generators
    class Install < Base

      def initialize
        @name = 'add_data_migration_support'
      end

      def file
        "#{DB_MIGRATIONS_PATH}/#{file_name}"
      end

      def table_name
        'data_migrations'
      end
    end
  end
end
