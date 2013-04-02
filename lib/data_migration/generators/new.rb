module DataMigration
  module Generators
    class New < Base

      def initialize name
        @name = name
        raise 'Invalid file name' if name.match(/^\d+/)
      end

      def file
        "#{DATA_MIGRATIONS_PATH}/#{file_name}"
      end
    end
  end
end
