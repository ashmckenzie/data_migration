module DataMigration
  module Generators

    class InstallGenerator < ::Rails::Generators::Base

      extend Forwardable

      source_root File.expand_path('../templates', __FILE__)

      def add_data_migration_support
        @install_generator = DataMigration::Generators::Install.new
        raise 'Data migration support is already setup' if data_migration_support_exists?
        template 'install.rb.erb', @install_generator.file
      end

      private

      attr_reader :install_generator

      def data_migration_support_exists?
        ActiveRecord::Base.connection.table_exists?(table_name)
      end

      def_delegators :@install_generator, :table_name, :klass_name
    end
  end
end
