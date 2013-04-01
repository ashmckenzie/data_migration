module DataMigration
  class NewGenerator

    def initialize name
      @name = name
      raise 'Invalid file name' if name.match(/^\d+/)
    end

    def file
      "#{DATA_MIGRATIONS_PATH}/#{file_name}"
    end

    def klass_name
      name.camelize
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
