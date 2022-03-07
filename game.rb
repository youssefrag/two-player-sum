require './player.rb'

class Game
  attr_accessor :p1, :p2, :current_player

  def initialize
    @p1 = Player.new('Player1')
    @p2 = Player.new('Player2')
    @current_player = @p2
  end
  def turn
    if @current_player == @p2
      @current_player = @p1
    else
      @current_player = @p2
    end
    random_num1 = rand(1...21)
    random_num2 = rand(1...21)
    sum = random_num1 + random_num2
    puts "#{@current_player.name}: What does #{random_num1} plus #{random_num2} equal?"
    print '>' 
    number = gets.chomp.to_i
    if number != sum
      @current_player.score = @current_player.score - 1
      puts "#{@current_player.name}: Seriously? No!"
    else
      puts "#{@current_player.name}: YES? You are correct."
    end
    puts "P1: #{@p1.score}/3 vs P2: #{@p2.score}/3"

    if @p1.score == 0
      puts "Player 2 wins with a score of #{@p2.score}/3"
      puts "----- GAME OVER -----"
    elsif @p2.score == 0
      puts "Player 1 wins with a score of #{@p1.score}/3"
      puts "----- GAME OVER -----"
      puts "Good bye!"
    else
      puts "----- NEW TURN -----"
      self.turn
    end
  end
end