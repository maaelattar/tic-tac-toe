require_relative 'board'
require_relative 'player'
  class Game
    attr_accessor :player1, :player2, :board, :current_player

    @@winning_cells = %w[123 456 789 147 258 369 159 357]

    def initialize(player1, player2, board = Board.new)
      @player1 = Player.new(player1)
      @player2 = Player.new(player2)
      @board = board
      @current_turn = 1
      @current_player = nil
      @winner = nil
    end

    def play
      allocate_symbols
      pick_first_turn
      take_turns
    end

    def pick_first_turn
      @current_player = [@player1, @player2].sample
      puts "#{@current_player.name} goes first!\n\n"
    end

    def allocate_symbols
      @player1.sym = 'x'
      @player2.sym = 'o'
    end

    def next_player
      @current_player = @current_player == @player1 ? @player2 : @player1
      @current_turn += 1
    end

    def take_turns
      until game_end?
        turn(@current_player)
        next_player
      end

      puts 'Game was a draw!' if draw?
    end

    def turn(player)
      puts "Turn #{@current_turn}, player: #{player.name}:"
      puts "---------------------------\n\n\n"
      @board.board_instructions
      @board.draw_board
      @board.put_symbol(get_valid_position(player), player.sym)
      check_winner(player)
    end

    def get_valid_position(player)
      print "#{player.name}, enter the cell number that you would like to use (1-9): "
      input = gets.chomp.to_i
      until valid_input?(input)
        print 'Invalid input! '
        puts 'Cell taken.' if @board.cell_taken?(input - 1)
        puts 'Number is not in range 1-9'
        input = gets.chomp.to_i
      end
      player.input << input.to_s
      input - 1
    end

    def draw?
      (@current_turn == (@board.cells.length + 1)) && @winner.nil?
    end

    def check_winner(player)
      if @@winning_cells.include?(player.input.chars.sort.join)
        @winner = player.name
        @board.draw_board
        puts "#{player.name} is the winner!\n"
        true
      end
    end

    def valid_input?(input)
      input > 0 && input < 10 && !@board.cell_taken?(input - 1)
    end

    def game_end?
      draw? || !@winner.nil?
    end
  end
