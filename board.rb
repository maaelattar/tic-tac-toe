class Board
  attr_reader :cells
  def initialize
    @cells = Array.new(9, ' ')
  end

  def board_instructions
    puts "Board instructions to help you choose the cell you want\n\n"
    puts '1 | 2 | 3 ',
         '----------',
         '4 | 5 | 6 ',
         '----------',
         '7 | 8 | 9 '
    puts "\n\n"
  end

  def draw_board
    board = ''
    puts "#{board}\n"
    (0..8).step(3) do |i|
      board += "#{@cells[i]} | #{@cells[i + 1]} | #{@cells[i + 2]} \n"
    end
    puts "#{board}\n"
  end

  def put_symbol(position, symbol)
    @cells[position] = symbol
  end

  def cell_taken?(position)
    @cells[position] == 'x' || @cells[position] == 'o'
  end
end
