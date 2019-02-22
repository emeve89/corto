require 'dry-container'
require 'dry-auto_inject'

module Corto
  module Infrastructure
    # Dry-Container
    class Container
      extend Dry::Container::Mixin

      register 'urls_repository' do
        Corto::Adapters::UrlRepo.new
      end

      register 'db_container' do
        Corto::Infrastructure::DB_CONTAINER
      end
    end
  end
end

Import = Dry::AutoInject(Corto::Infrastructure::Container)
