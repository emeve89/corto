module Corto
  module Adapters
    # Controller that receives a url and then pass it to the use case.
    class UrlShortenerController
      include Import['presenter']

      def call(url)
        use_case = Corto::UseCases::Url::Shortener.new
        result = use_case.call(url)
        presenter.call(result)
      end
    end
  end
end
