module DataMigration
  module Generators
    class Base

      def timestamp
        Time.now.strftime('%Y%m%d%H%M%S')
      end

      private

      attr_reader :name

      def file_name
        "#{timestamp}_#{name.underscore}.rb"
      end

      def klass_name
        name.camelize
      end
    end
  end
end
