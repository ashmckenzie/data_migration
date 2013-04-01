# DataMigration

DataMigration adds the ability to create data migration files (similar to Rails schema migrations) and migrate them.  The main benefit is they are separate from Rails schema migrations and avoid problems such as cached columns.

## Installation

Add this line to your application's Gemfile:

    gem 'data_migration', github: 'ashmckenzie/data_migration'

And then execute:

    $ bundle

## Usage

### Add data migration support

    $ rails generate data_migration:install
    $ rake db:migrate

This drops a new schema migration into `db/migrate` called `YYYYMMDDHHMMSS_add_data_migration_support.rb` and creates a new `data_migrations` table.

### Adding new data migrations

    $ rails generate data_migration:new <name_of_migration>
    $ rake db:data_migrate

### Rolling back data migrations

#### Using STEP=n

    $ rake db:data_migrate:rollback STEP=1

#### Using VERSION=YYYYMMDDHHMMSS

    $ rake db:data_migrate:rollback VERSION=YYYYMMDDHHMMSS

### Data migrations status

    $ rake db:data_migrate:status

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
