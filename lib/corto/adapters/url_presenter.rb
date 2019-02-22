module Corto
  module Adapters
    # Controller that receives a url and then pass it to the use case.
    class UrlPresenter
      def call(result)
        puts "Encoded url: #{result.value!}"
      end
    end
  end
end
