#puts "\e[H\e[2J" ->画面消去

class Player
  def initialize(name)
    @name = name
  end 
  def turn(*board, size, number)
    print_board(*board, size)  
    puts "#{@name}'s Turn:"
    row, column = position_select()
    until board[size * row + column] == 0 do
      print_board(*board, size)
      puts "#{@name} : Please Select Empty Square"
      row, column = position_select()
    end
    board[size * row + column] = number
    check(*board, size)
    board_status(*board)
    board
  end
end

def board_status(*board)
  unless board.include?(0) 
    puts "Game-Board is Full!"
    puts "~Game Over~"
    exit if gets
  end
end

def position_select()
  puts "Input Row Number > "
  row = gets.chomp.to_i
  puts "Input Column Number > "
  if column = gets.chomp.to_i
    clear_screen
  end
  return row, column
end

def clear_screen
  puts "\e[H\e[2J"
end

def print_board(*board, size_of_board)
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

def result(num, size)
  if num == size then
    clear_screen
    puts "Winner : Player1!"
    exit if gets
  elsif num == size * (-1) then
    clear_screen
    puts "Winner : Player2!"
    exit if gets
  end
end

def check(*board, size)
  repeat_time = size - 1
  #横
  check_widthwise(*board, repeat_time, size)
  #縦
  check_lengthwise(*board, repeat_time, size)
  #斜め\
  check_left_slanting(*board, repeat_time, size)
  #斜め /
  check_right_slanting(*board, repeat_time, size)
end

def check_widthwise(*board, repeat_time, size)
  (0..repeat_time).each do |i|
    num = 0
    (0..repeat_time).each do |j|
      num += board[i * size + j]
    end
    result(num, size) 
  end
end

def check_lengthwise(*board, repeat_time, size)
  (0..repeat_time).each do |i|
    num = 0
    (0..repeat_time).each do |j|
      num += board[i + size * j]
    end
    result(num, size) 
  end
end

def check_left_slanting(*board, repeat_time, size)
  num = 0
  (0..repeat_time).each do |i|
    num += board[size * i + i]
  end
  result(num, size)
end

def check_right_slanting(*board, repeat_time, size)
  num = 0
  (0..repeat_time).each do |i|
    num += board[size * i + (size - 1 - i)]
  end
  result(num, size)
end

puts "Welcome to OX Game!\n"
puts "Please Enter the Name of Player1 > "
name1 = gets.chomp
p1 = Player.new(name1)
puts "Please Enter the Name of Player2 > "
name2 = gets.chomp
p2 = Player.new(name2)
puts "Please Enter the Size of Game-Board > "
size = gets.chomp.to_i

puts "Game Start!"

clear_screen if gets

board = Array.new(size**2, 0)

while true do
  board = p1.turn(*board, size, 1)
  board = p2.turn(*board, size, -1)
end