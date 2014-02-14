module Codebreaker
  class Initializer
    def initialize
      @game   = Codebreaker::Game.new(STDOUT)
      secret = Codebreaker::Code.generate
      @game.start(secret)
      at_exit { puts "\n***\nThe secret code was: #{secret}\n***"}
    end

    def process(guess)
      if @game.guess(guess)
        catch :again do
          loop do
            puts "\nPlay again? (Yes, No)\n"
            again? gets.chomp
          end
        end
        @won = true
      end
    end

    def again?(answer)
      if %w[YES Yes yes Y y].include? answer
        throw :again
      elsif %w[NO No no N n].include? answer
        exit
      end
    end

    def won?
      @won
    end
  end
end