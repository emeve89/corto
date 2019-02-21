require 'singleton'

module Corto
  module Infrastructure
    module DB
      module URL
        # In memory database to store the urls processed by the system.
        class InMemory
          include Singleton

          def initialize
            @urls = []
            @id = 0
          end

          def all
            @urls
          end

          def next_id
            @id + 1
          end

          def save(url)
            @id += 1
            url[:id] = @id
            @urls << url
          end

          def find(id)
            @urls.find { |url| url[:id] == id }
          end
        end
      end
    end
  end
end
