require 'dry/transaction'
require_relative './utils/bijective'

module Corto
  module UseCases
    module Url
      # Use case that receives a url and convert it in a shorter one.
      class Shortener
        include Dry::Transaction
        include Import['urls_repository']
        include Utils::Bijective

        step :get_next_id
        step :shorten
        step :save

        private

        def get_next_id(input)
          next_id = urls_repository.next_id
          Success(next_id: next_id, url: input)
        end

        def shorten(input)
          encoded_id = encode(input[:next_id])
          Success(encoded_id: encoded_id, url: input[:url])
        end

        def save(input)
          urls_repository.create(long: input[:url], short: input[:encoded_id])
          Success(input[:encoded_id])
        end
      end
    end
  end
end
