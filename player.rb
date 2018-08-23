class Player
  def self.position_select()
    puts "Input Row Number > "
    row = gets.chomp.to_i
    puts "Input Column Number > "
    if column = gets.chomp.to_i
      Screen.clear_screen
    end
    return row, column
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
end