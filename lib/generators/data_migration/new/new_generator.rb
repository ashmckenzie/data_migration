module DataMigration
  module Generators

    class NewGenerator < ::Rails::Generators::Base

      NEW_MIGRATION_TEMPLATE_FILE_NAME = 'new.rb.erb'

      source_root File.expand_path('../templates', __FILE__)

      argument :migration_name, :type => :string

      def create_migration_file
        @migration_generator = DataMigration::NewGenerator.new(migration_name)
        template NEW_MIGRATION_TEMPLATE_FILE_NAME, @migration_generator.file
      end

      private

      attr_reader :migration_generator

      def klass_name
        migration_generator.klass_name
      end
    end
  end
end
