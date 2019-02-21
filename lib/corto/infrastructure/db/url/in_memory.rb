module Corto
  module Infrastructure
    module DB
      module URL
        # In memory database to store the urls processed by the system.
        class InMemory
          def initialize
            @urls = []
          end

          def all
            @urls
          end

          def next_id
            @urls.count + 1
          end

          def save(url)
            @urls << url
          end

          def find(short:)
            @urls.select { |url| url[:short] == short }
          end
        end
      end
    end
  end
end
