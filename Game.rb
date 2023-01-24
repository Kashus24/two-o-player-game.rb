require "./Players"
require "./Questions"

class Game
  def initialize
    puts "Player one, what is your name! "
    player1_name = $stdin.gets.chomp
    puts "Player two, what is your name! "
    player2_name = $stdin.gets.chomp

    @player1 = Players.new(player1_name)
    @player2 = Players.new(player2_name)

    puts "Hello #{@player1.name} and #{@player2.name}! It's time to duel!"
  end

  def score
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
    puts "--- NEW TURN ---"
  end

  def game_over
    if @player1.is_dead
      puts "#{@player2.name} has earned victory with #{@player2.lives} lives!"
    else
      puts "#{@player1.name} has earned victory with #{@player1.lives} lives!"
    end
    puts "---GAME OVER---"
    puts "Catch you later!"
  end

  def swap(current_player)
    if (current_player == @player1)
      current_player = @player2
    else
      current_player = @player1
    end
    return current_player
  end

  def continue_game
    (@player1.is_dead || @player2.is_dead) == false
  end

  def start
    current_player = @player1
    while continue_game

      question = Question.new

      question.ask(current_player)

      score
      current_player = swap(current_player)
    end

    game_over
  end

end