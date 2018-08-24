class Game
  def self.welcome_message
    puts "Welcome to OX Game!\n"
  end
  
  def self.start_message
    puts "Game Start!"
  end
  
  def turn(*board, size, number, name)
    row, column = Player.input(*board, size, name, "'s Turn:")
    until board[size * row + column] == 0 do
      row, column = Player.input(*board, size, name, " : Please Select Empty Square")
    end
    board[size * row + column] = number
    Checker.check(*board, size ,name)
    Checker.board_status(*board)
    board
  end
  
  def initialize
    require './player'
    require './checker'
    require './screen'
  end
end

