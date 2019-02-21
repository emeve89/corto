require 'dry/transaction'

module Corto
  module Url
    # Use case that receives a url and convert it in a shorter one.
    class Shortener
      include Dry::Transaction
      include Import['urls_repository']

      step :shorten
      step :save

      private

      def shorten(input); end

      def save(input); end
    end
  end
end
