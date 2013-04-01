module DataMigration
  module Generators

    class InstallGenerator < ::Rails::Generators::Base

      MIGRATION_INSTALL_TEMPLATE_FILE_NAME = 'install.rb.erb'

      source_root File.expand_path('../templates', __FILE__)

      def add_data_migration_support
        @migration_install = DataMigration::InstallGenerator.new
        copy_file MIGRATION_INSTALL_TEMPLATE_FILE_NAME, @migration_install.file
      end
    end
  end
end
