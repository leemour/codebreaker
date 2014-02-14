module Codebreaker
  class Code
    CHARS = (0..9).to_a

    def self.generate
      4.times.map { CHARS.sample }.join('')
    end
  end
end