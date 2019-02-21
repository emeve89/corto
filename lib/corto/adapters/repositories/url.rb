module Corto
  module Adapters
    module Repositories
      # Repository that acts as a glue between the use case and
      # the different implementations of data sources.
      class Url
        include Import['urls_datasource']

        def find(short:)
          urls_datasource.find(short: short)
        end

        def all
          urls_datasource.all
        end

        def next_id
          urls_datasource.next_id
        end

        def save(url)
          urls_datasource.save(url)
        end
      end
    end
  end
end
