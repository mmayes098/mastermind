require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(instance)
        puts "exact matches: #{@secret_code.num_exact_matches(instance)}"
        puts "near matches: #{@secret_code.num_near_matches(instance)}"
    end

    def ask_user_for_guess
        puts "Enter a code: "
        guess = gets.chomp
        instance = Code.from_string(guess)
        self.print_matches(instance)
        @secret_code.pegs == instance.pegs
    end
end
