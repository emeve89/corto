require 'rom'

module Corto
  module Infrastructure
    # ROM Schema Configuration
    module DB
      ROM_DB = ROM.container(:sql, 'sqlite::memory') do |config|
        config.default.create_table(:urls) do
          primary_key :id
          column :short, String, null: false
          column :long, String, null: false
        end
      end
    end
  end
end
