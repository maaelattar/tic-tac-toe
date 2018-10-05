require_relative 'game'
require_relative 'board'
require_relative 'player'

class TicTacToeGame
  attr_accessor :name1, :name2

  def initialize
    welcome_screen
    game_start
    game_loop
  end

  def welcome_screen
    puts "\n\tTic Tac Toe Game\t"
    puts "\t----------------\t\n\n"
    print "Enter Player 1's name: "
    @name1 = gets.chomp
    puts ' '
    print "Enter Player 2's name: "
    @name2 = gets.chomp
    puts ' '
  end

  def game_loop
    game_start while play_again
  end

  def game_start
    game = Game.new(@name1, @name2)
    game.play
  end

  def play_again
    puts "\nGame over do you want to play again (Y/N)?"
    loop do
      input = gets.chomp.upcase
      return true if input == 'Y'
      return false if input == 'N'
      puts "\nInvalid input do you want to play again (Y/N)?"
    end
  end
end

TicTacToeGame.new
