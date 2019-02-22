module Corto
  module UseCases
    module Url
      # Class that receives a base64 code and returns a URL Entity.
      class Decoder
        include Dry::Transaction
        include Import['urls_repository']
        include Utils::Bijective

        step :reverse

        private

        def reverse(input)
          id = decode(input)
          original_url = urls_repository.find(id)
          url = Corto::Entities::URL.new(short: input, long: original_url.long)
          Success(url)
        end
      end
    end
  end
end
