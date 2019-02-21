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
          url = Corto::Entities::URL.new(short: input, long: original_url[:url])
          Success(url)
        end
      end
    end
  end
end
