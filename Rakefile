require './init'

namespace :db do
  require 'sequel'
  Sequel.extension :migration
  database = App.database

  desc 'Reset DB'
  task :reset => :app do
    database.tables.each{|x| database.drop_table(x)}
    Sequel::Migrator.apply(database, 'db/migrations')
  end

  desc 'Run DB migrations'
  task :migrate => :app do
    Sequel::Migrator.apply(database, 'db/migrations')
  end

  desc 'Rollback migration'
  task :rollback => :app do
     version  = (row = database[:schema_info].first) ? row[:version] : nil
     Sequel::Migrator.apply(database, 'db/migrations', version - 1)
  end

  desc 'Dump the database schema'
  task :dump => :app do
    `sequel -d #{database.url} > db/schema.rb`
    `pg_dump --schema-only #{database.url} > db/schema.sql`
  end
end
