require "./Players"

class Question
  attr_accessor :num1, :num2, :answer
  
  def initialize()
    @num1 = rand(1...20)
    @num2 = rand(1...20)
    @answer = @num1 + @num2 
  end

  def answer_check(player)
    if (@input_answer == @answer)
      puts "Nice, you got it!"
    else
      puts "EEE ERR sorry not right!"
      player.lostLife
    end
  end

  def ask(player)
    puts "#{player.name}: What's #{@num1} + #{@num2}?"
    @input_answer = $stdin.gets.chomp.to_i

    answer_check(player)
  end
end