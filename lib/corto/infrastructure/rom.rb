require 'rom'

module Corto
  module Infrastructure
    DB_CONTAINER = ROM.container(:sql, 'sqlite::memory') do |config|
      # Create Table
      config.default.connection.create_table(:urls) do
        primary_key :id
        column :short, String, null: false
        column :long, String, null: false
      end

      config.relation(:urls) do
        schema(infer: true)
        auto_struct(true)
      end
    end
  end
end
