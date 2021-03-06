#puts "\e[H\e[2J" ->画面消去

class Player
  def initialize(name)
    @name = name
  end
  
  def turn(*board, size, number)
    row, column = input(*board, size, @name, "'s Turn:")
    until board[size * row + column] == 0 do
      row, column = input(*board, size, @name, " : Please Select Empty Square")
    end
    board[size * row + column] = number
    check(*board, size)
    board_status(*board)
    board
  end
end

def input(*board, size, name, text)
  print_board(*board, size)
  puts "#{name}#{text}"
  position_select
end

def board_status(*board)
  return if board.include?(0)
  puts "Game-Board is Full!"
  puts "~Game Over~"
  exit if gets
end

def position_select
  row = column = ""
  while row == "" || column == "" do
    puts "Input Row Number > "
    row = gets.chomp
    puts "Input Column Number > "
    column = gets.chomp
  end
  [row.to_i, column.to_i]
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
    when 1
      print " O |"
    when -1
      print " X |"
    when 0
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