require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

task :drop_db do
  require 'sqlite3'
  db = SQLite3::Database.new './lib/corto/infrastructure/db/sqlite.db'

  db.execute <<-SQL
    DROP TABLE corto_infrastructure_db_urls;
  SQL

  puts 'TABLE DROPPED'
end

task :create_db do
  require 'sqlite3'
  db = SQLite3::Database.new './lib/corto/infrastructure/db/sqlite.db'

  # Create a table
  db.execute <<-SQL
    CREATE TABLE corto_infrastructure_db_urls (
      id integer primary key autoincrement,
      short varchar(255),
      long varchar(255)
    );
  SQL

  puts 'DB CREATED'
end
