require 'dry-container'
require 'dry-auto_inject'

module Corto
  module Infrastructure
    # Dry-Container
    class Container
      extend Dry::Container::Mixin

      register 'urls_repository' do
        Corto::Adapters::Repositories::Url.new
      end

      register 'urls_datasource' do
        Corto::Infrastructure::DB::URL::InMemory.new
      end
    end
  end
end

Import = Dry::AutoInject(Corto::Infrastructure::Container)
