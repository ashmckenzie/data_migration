module DataMigration
  module Generators

    class NewGenerator < ::Rails::Generators::Base

      extend Forwardable

      source_root File.expand_path('../templates', __FILE__)
      argument :migration_name, :type => :string

      def create_migration_file
        @new_generator = DataMigration::Generators::New.new(migration_name)
        template 'new.rb.erb', @new_generator.file
      end

      private

      attr_reader :new_generator

      def_delegators :@new_generator, :klass_name
    end
  end
end
