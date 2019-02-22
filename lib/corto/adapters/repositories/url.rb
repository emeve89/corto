require 'rom-repository'

module Corto
  module Adapters
    module Repositories
      # Url Relation
      class Urls < ROM::Relation[:sql]
        schema(infer: true)
      end

      # Repository that acts as a glue between the use case and
      # the different implementations of data sources.
      class Url < ROM::Repository[:urls]
        include Import[rom: 'urls_datasource']

        commands :create, :update, :by_pka
      end
    end
  end
end

Corto::Infrastructure::DB::ROM_DB.register_relation(Corto::Adapters::Repositories::Urls)
