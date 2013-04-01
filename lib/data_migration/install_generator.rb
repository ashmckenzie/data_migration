module DataMigration
  class InstallGenerator

    MIGRATION_NAME = 'add_data_migration_support'

    def initialize
      @name = MIGRATION_NAME
    end

    def file
      "#{DB_MIGRATIONS_PATH}/#{file_name}"
    end

    private

    attr_reader :name

    def timestamp
      Time.now.strftime('%Y%m%d%H%M%S')
    end

    def file_name
      "#{timestamp}_#{name.underscore}.rb"
    end
  end
end

