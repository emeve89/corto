module Corto
  module UseCases
    module Url
      class Decoder
        include Dry::Transaction
        include Import['urls_repository']
        include Utils::Bijective

        step :reverse

        private

        def reverse(input)
          id = decode(input)
          original_url = urls_repository.find(id)
          Success(original_url)
        end
      end
    end
  end
end
