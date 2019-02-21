module Corto
  module UseCases
    module Url
      module Utils
        module Bijective
          ALPHABET = (('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a).join

          private

          def encode(id)
            return ALPHABET[0] if id.zero?
            s = ''
            base = ALPHABET.length
            while id > 0
              s << ALPHABET[id.modulo(base)]
              id /= base
            end
            s.reverse
          end

          def decode(base64)
            i = 0
            base = ALPHABET.length
            base64.each_char { |c| i = i * base + ALPHABET.index(c) }
            i
          end
        end
      end
    end
  end
end