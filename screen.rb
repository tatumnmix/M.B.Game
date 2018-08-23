#puts "\e[H\e[2J" ->画面消去
class Screen
  def self.clear_screen
    puts "\e[H\e[2J"
  end
  def self.print_board(*board, size_of_board)
    clear_screen
    (0..size_of_board**2).each do |i|
      if i % size_of_board == 0
        puts "\n"
      end
      case board[i]
      when 1 then
        print " O |"
      when -1 then
        print " X |"
      when 0 then
        print "   |"
      end
    end
  end
end
