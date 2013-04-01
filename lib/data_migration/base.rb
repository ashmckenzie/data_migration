module DataMigration
  class Base

    private

    def reload!
      ActionDispatch::Reloader.cleanup!
      ActionDispatch::Reloader.prepare!
    end

    def execute query
      ActiveRecord::Base.connection.execute(query)
    end
  end
end
