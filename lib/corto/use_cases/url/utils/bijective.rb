module Corto
  module UseCases
    module Url
      module Utils
        module Bijective
          ALPHABET = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).join.freeze
          BASE = ALPHABET.size.freeze

          private

          def encode(id)
            return ALPHABET[0] if id.zero?
            ''.tap do |s|
              while id > 0
                s << ALPHABET[id.modulo(BASE)]
                id /= BASE
              end
            end.reverse
          end

          def decode(base64)
            i = 0
            base64.each_char { |char| i = i * BASE + ALPHABET.index(char) }
            i
          end
        end
      end
    end
  end
end