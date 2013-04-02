require 'benchmark'

module DataMigration
  class Migration < Base

    def initialize file
      @file = Pathname.new(file)
      load(file)
    end

    def up!
      announce 'migrating'

      timing = process! :up do
        add_version_entry!
      end

      announce "migrated (#{sprintf("%0.4fs", timing.real)})"
      puts

      true
    end

    def down!
      announce 'reverting'

      timing = process! :down do
        remove_version_entry!
      end

      announce "reverting (#{sprintf("%0.4fs", timing.real)})"
      puts

      true
    end

    def version
      file.basename.to_s.match(/^(?<version>\d+)_/)[:version]
    end

    def description
      file.basename.to_s.match(/_(?<description>\w+)\.rb$/)[:description].humanize
    end

    private

    attr_reader :file

    def measure
      Benchmark.measure do
        yield
      end
    end

    def process! direction
      measure do
        transaction do
          klass_instance.send(direction)
          yield
        end
      end
    end

    def transaction
      ActiveRecord::Base.transaction do
        yield
      end
    end

   def announce message
      text = " #{version} #{klass_name}: #{message}"
      length = [0, 75 - text.length].max
      puts "== %s %s" % [text, "=" * length]
    end

    def add_version_entry!
      execute("INSERT INTO data_migrations (version) VALUES(#{sanitize(version)})")
    end

    def remove_version_entry!
      execute("DELETE FROM data_migrations WHERE version = #{sanitize(version)}")
    end

    def klass_instance
      "DataMigration::MigrationFiles::#{klass_name}".constantize.new
    end

    def klass_name
      file.basename.to_s.match(/_(?<file_name>.+)\.rb$/)[:file_name].camelize
    end
  end
end
