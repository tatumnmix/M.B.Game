class Game
  def turn(*board, size, number, name)
    Screen.print_board(*board, size)  
    puts "#{name}'s Turn:"
    row, column = Player.position_select()
    until board[size * row + column] == 0 do
      Screen.print_board(*board, size)
      puts "#{name} : Please Select Empty Square"
      row, column = Player.position_select()
    end
    board[size * row + column] = number
    Checker.check(*board, size)
    Checker.board_status(*board)
    board
  end
end

