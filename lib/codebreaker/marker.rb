module Codebreaker
  class Marker
    def initialize(secret, guess)
      @secret = secret.chars
      @guess  = guess.chars
    end

    def exact_match_count
      @exact ||= (0..3).count { |i| @guess[i] == @secret[i] }
    end

    def number_match_count
      total_match_count - exact_match_count
    end

    def total_match_count
      secret = @secret.dup
      @guess.count { |n| number_match? secret, n }
    end

    private

    def number_match?(secret, n)
      secret.delete_at secret.index(n) if secret.index n
    end
  end
end