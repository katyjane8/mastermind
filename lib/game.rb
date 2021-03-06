require_relative 'messages'

class Game
  include Messages

  def initialize
    @count = 0
    random = ['r','b','g','y'].shuffle
    @result = random.join
    @start = Time.now
    @finish = Time.now
  end

  def intro
    welcome_message
    input = gets.chomp.downcase
    case input
    when "p"||"P" then start_game
    when "i"||"I" then instructions; intro
    when quit_commands(input) then exit
    end
  end

  def start_game
    play_game
    @start
    input = gets.chomp.downcase
    loop do
      if input == @result
        elapsed_time = @finish - @start
        puts "Congratulations! You guessed the sequence  in #{@count} guesses over #{Time.at(elapsed_time).utc.strftime("%M/%S")}
        Do you want to (p)lay again or (q)uit?"
        input = gets.chomp
        case input
        when "p"||"P"||"play" then start_game
        when quit_commands(input) then exit
        end
      elsif input.length < 4 || input.length > 4
        guess_error
        start_game
      elsif input[0] == @result[0] || input[1] == @result[1] || input[2] == @result[2] || input[3] == @result[3]
        @count += 1
        puts "# '#{input}' has 1 of the correct elements with 1 in the correct positions
        You've taken #{@count} guesses"
        input = gets.chomp
      elsif input[0] == @result[0] && input[1] == @result[1] || input[1] == @result[1] && input[2] == @result[2] || input[2] == @result[2] && input[3] == @result[3]
        @count += 1
        puts "# '#{input}' has 2 of the correct elements with 2 in the correct positions
        You've taken #{@count} guess"
        input = gets.chomp
      elsif input[0] == @result[0] && input[1] == @result[1] && input[2] == @result[2] || input[1] == @result[1] && input[2] == @result[2] && input[3] == @result[3]
        @count += 1
        puts "# '#{input}' has 3 of the correct elements with 3 in the correct positions
        You've taken #{@count} guess"
        input = gets.chomp
      elsif input == "cheat"
        puts "Answer was #{@result}! Better luck next time."
        game_over
      elsif input == "q"
        puts "Answer was #{@result}! Better luck next time."
        game_over
      elsif
        @count >= 6
        @finish
        puts "Answer was #{@result}! Better luck next time."
        game_over
      else input != @result
        @count += 1
        puts "Try another combination"
        input = gets.chomp
      end
    end
  end
end

  # def keep_trying
  #   5.times do
  #   input = gets.chomp
  #     if input == @result
  #       won_game
  #     elsif input[0] == @result[0] || input[1] == @result[1] || input[2] == @result[2] || input[3] == @result[3]
  #       @count += 1
  #       puts "# '#{input}' has 1 of the correct elements with 1 in the correct positions
  #       You've taken #{@count} guess"
  #     elsif input[0] == @result[0] && input[1] == @result[1] || input[1] == @result[1] && input[2] == @result[2] || input[2] == @result[2] && input[3] == @result[3]
  #       @count += 1
  #       puts "# '#{input}' has 2 of the correct elements with 2 in the correct positions
  #       You've taken #{@count} guess"
  #     elsif input[0] == @result[0] && input[1] == @result[1] && input[2] == @result[2] || input[1] == @result[1] && input[2] == @result[2] && input[3] == @result[3]
  #       @count += 1
  #       puts "# '#{input}' has 3 of the correct elements with 3 in the correct positions
  #       You've taken #{@count} guess"
  #     elsif input == "c"||"cheat"
  #       puts "Answer was #{@result}! Better luck next time."
  #       game_over
  #     elsif input != @result
  #       puts "Try another combination"
  #     elsif
  #       @count == 4
  #       game_over
  #     end
  #   end
  # end


# Congratulations! You've guessed the sequence! What's your name?
#
# > Jeff
#
# Jeff, you guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
# 22 seconds. That's 1 minute, 10 seconds faster and two guesses fewer than the
# average.
#
# === TOP 10 ===
# 1. Jeff solved 'GRRB' in 8 guesses over 4m22s
# 2. Jeff solved 'BRGG' in 11 guesses over 4m45s
# 3. Jorge solved 'BBBB' in 12 guesses over 4m15s
# 4. Jorge solved 'GGBB' in 12 guesses over 5m12s
