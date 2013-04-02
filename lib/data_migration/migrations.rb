module DataMigration
  class Migrations < Base

    def initialize
      reload!
    end

    def process_migrations!
      pending_migrations.each do |migration|
        process_migration!(migration, :up)
      end
    end

    def process_migration! migration, direction
      migration.send("#{direction}!")
    end

    def rollback_migrations! number
      raise 'Not that many migrations to rollback!' if number > processed_migrations.count

      processed_migrations.to_a.reverse[0...number].each do |version, migration|
        process_migration!(migration, :down)
      end
    end

    def rollback_migration! version
      raise 'Unknown data migration!' unless processed_migrations[version]

      process_migration!(processed_migrations[version], :down)
    end

    def display_status
      puts "\ndatabase: #{ActiveRecord::Base.connection_config[:database]}\n\n"
      puts "#{'Status'.center(8)}  #{'Migration ID'.ljust(14)}  Migration Name"
      puts "-" * 50

      candidate_migrations.each do |version, migration|
        status = processed_migrations.keys.include?(version) ? 'up' : 'down'
        puts "#{status.center(8)}  #{migration.version.ljust(14)}  #{migration.description}"
      end
    end

    private

    def candidate_migrations
      @candidate_migrations ||= begin
        Dir['./db/data_migrations/*.rb'].inject({}) do |all, file|
          migration = Migration.new(File.expand_path(file))
          all[migration.version] = migration
          all
        end
      end
    end

    def pending_migrations
      candidate_migrations.reject { |version| processed_migrations.include?(version) }.values
    end

    def processed_migrations
      @processed_migrations ||= begin
        execute("SELECT version from data_migrations").inject({}) do |all, result|
          version = result['version']
          migration = candidate_migrations[version]
          all[migration.version] = migration
          all
        end
      end
    end
  end
end
