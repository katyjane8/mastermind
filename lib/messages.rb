module Messages

  def welcome_message
    puts "Welcome to MASTERMIND :: Would you like to (p)lay, read the (i)nstructions, or (q)uit?
     >"
  end

  def play_game
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
  end

  def instructions
    puts "Play the game by putting in a sequence of four letters in the order of your choosing, (r)ed,
    (g)reen, (b)lue, and (y)ellow. Guess correctly within five tries and you win!"
  end

  def won_game
    puts "Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
    22 seconds.
    Do you want to (p)lay again or (q)uit?"
  end

  def try_again
    puts "Try again"
  end

  def quit_commands(command)
    %w(q Q quit Quit QUIT).include?(command)
    puts `clear`
  end

  def game_over
    puts "Sorry, you lose!"
    exit
    puts `clear`
  end

  def guess_error
    puts "Please enter four letters"
  end
end
