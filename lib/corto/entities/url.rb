require 'dry-struct'
require_relative './utils/types.rb'

module Corto
  module Entities
    # Entitiy that represent a URL that was processed by the system.
    # url = Corto::Entities::URL.new(long: "long url", short: "short url")
    class URL < Dry::Struct
      attribute :short, Types::Strict::String
      attribute :long, Types::Strict::String
    end
  end
end
