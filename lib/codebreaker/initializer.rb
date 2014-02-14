module Codebreaker
  class Initializer
    YESS = %w[YES Yes yes Y y]
    NOS  = %w[NO No no N n]

    def initialize
      @game  = Codebreaker::Game.new(STDOUT)
      secret = Codebreaker::Code.generate
      @game.start(secret)
      at_exit { puts "\n***\nThe secret code was: #{secret}\n***"}
    end

    def process(guess)
      if @game.guess(guess)
        @won = true
        catch :again do
          loop do
            puts "\nPlay again? (Yes, No)\n"
            again? gets.chomp
          end
        end
      end
    end

    def again?(answer)
      if YESS.include? answer
        throw :again
      elsif NOS.include? answer
        exit
      end
    end

    def won?
      @won
    end
  end
end