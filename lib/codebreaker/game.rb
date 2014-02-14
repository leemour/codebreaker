module Codebreaker
  class Game
    def initialize(output)
      @output = output
    end

    def start(secret)
      @secret = secret
      @output.puts 'Welcome to Codebreaker!'
      @output.puts 'Enter guess:'
    end

    def guess(guess)
      @output.puts "Secret code is #{@secret}" if guess == 'secret'
      mark guess
      winning?(guess) ? stop || true : false
    end

    private

    def mark(guess)
      marker = Marker.new(@secret, guess)
      @output.puts '+'*marker.exact_match_count +
                   '-'*marker.number_match_count
    end

    def stop
      @output.puts "\n***\nYou are 100% correct.\nYou win the game!!!\n***\n"
    end

    def winning?(guess)
      guess == @secret
    end
  end
end