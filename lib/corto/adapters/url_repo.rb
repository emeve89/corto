require 'rom-repository'

module Corto
  module Adapters
    # Repository that acts as a glue between the use case and
    # the different implementations of data sources.
    class UrlRepo < ROM::Repository[:urls]
      include Import.args['db_container']

      commands :create

      def next_id
        urls.count + 1
      end

      def find(id)
        urls.by_pk(id).one!
      end
    end
  end
end
