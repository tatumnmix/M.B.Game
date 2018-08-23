#puts "\e[H\e[2J" ->画面消去

def print_board( *array, size )
  0.upto( size ** 2 ) do |i|
    if i % size == 0 then
      puts "\n"
    end
    case array[ i ]
      when 1 then
        print " O |"
      when -1 then
        print " X |"
      when 0 then
        print "   |"
    end
  end
end

def result( num, size )
  if num == size then
    puts "Winner : Player1!"
    if gets then
      exit
    end
  elsif num == size * ( -1 ) then
    puts "Winner : Player2!"
    if gets then
      exit
    end
  end
end

def check( *array, size )
  #横
  num = 0
  0.upto( size-1 ) do |i|
    0.upto( size-1 ) do |j|
      num += array[ i * size + j ]
    end
    #puts "check -"
    result( num, size ) 
  end
  #縦
  num = 0
  0.upto( size-1 ) do |i|
    0.upto( size-1 ) do |j|
      num += array[ i + size * j ]
    end
    #puts "check |"
    result( num, size )
  end
  #斜め/
  num = 0
  0.upto( size-1 ) do |i|
      num += array[ size * i + i ]
  end
  #puts "check /"
  result( num, size )
  #斜め\
  num = 0
  0.upto( size-1 ) do |i|
      num += array[ size * i + ( size - 1 - i )]
  end
  #puts "check ¥"
  result( num, size )
end

puts "Welcome to OX Game!\n"
puts "Please Enter the Name of Player1 > "
p1 = gets.chomp
puts "Please Enter the Name of Player2 > "
p2 = gets.chomp

puts "Please Enter the Size of Game-Board > "
size = gets.chomp.to_i

puts "Game Start!"

if gets then
  puts "\e[H\e[2J"
end

board = Array.new( size ** 2, 0 )

while board.include?( 0 )  do
  print_board( *board, size )  
  puts "#{p1}'s Tern:"
  puts "Please input row number > "
  row = gets.chomp.to_i
  puts "Please input column number > "
  column = gets.chomp.to_i
  until board[ size * row + column ] == 0 do
    puts "\e[H\e[2J"
    print_board( *board, size )
    puts "Please Select Empty Square"
    puts "input row number > "
    row = gets.chomp.to_i
    puts "input column number > "
    if column = gets.chomp.to_i then
      puts "\e[H\e[2J"
    end
  end
  board[ size * row + column ] = 1
  check( *board, size )
  puts "\e[H\e[2J"

  print_board( *board, size )  
  puts "#{p2}'s Tern:"
  puts "Please input row number > "
  row = gets.chomp.to_i
  puts "Please input column number > "
  column = gets.chomp.to_i
  until board[ size * row + column ] == 0 do
    puts "\e[H\e[2J"
    print_board( *board, size )
    puts "Please Select Empty Square"
    puts "input row number > "
    row = gets.chomp.to_i
    puts "input column number > "
    if column = gets.chomp.to_i then
      puts "\e[H\e[2J"
    end
  end
  board[ size * row + column ] = -1
  check(*board, size )
  puts "\e[H\e[2J"
end

puts "Game-Board is Full!"
puts "Game Over"
if gets then
  exit
end
