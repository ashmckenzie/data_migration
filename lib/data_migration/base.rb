module DataMigration
  class Base

    private

    def sanitize input
      ActiveRecord::Base.sanitize(input)
    end

    def execute query
      ActiveRecord::Base.connection.execute(query)
    end
  end
end
