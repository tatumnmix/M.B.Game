class Player
  def self.position_select
    row = column = ""
    while row == "" || column == "" do
      puts "Input Row Number > "
      row = gets.chomp
      puts "Input Column Number > "
      column = gets.chomp
    end
      [row.to_i, column.to_i]
  end
  
  def self.setup
    puts "Please Enter the Name of Player1 > "
    name1 = gets.chomp
    puts "Please Enter the Name of Player2 > "
    name2 = gets.chomp
    puts "Please Enter the Size of Game-Board > "
    size = gets.chomp.to_i
    return name1, name2, size
  end
  
  def self.input(*board, size, name, text)
    Screen.print_board(*board, size)
    puts "#{name}#{text}"
    position_select
  end
end