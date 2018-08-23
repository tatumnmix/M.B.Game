#puts "\e[H\e[2J" ->画面消去

class Player
  def initialize( name )
    @name = name
  end 
  def tern( *board, size, number )
    print_board( *board, size )  
    puts "#{ @name }'s Tern:"
    puts "Please input row number > "
    row = nil 
    column = nil
    row = gets.chomp.to_i
    puts "Please Input Column Number > "
    column = gets.chomp.to_i
    until board[ size * row + column ] == 0 do
      puts "\e[H\e[2J"
      print_board( *board, size )
      puts "#{@name} : Please Select Empty Square"
      puts "Input Row Number > "
      row = gets.chomp.to_i
      puts "Input Column Number > "
      if column = gets.chomp.to_i then
        puts "\e[H\e[2J"
      end
    end
    board[ size * row + column ] = number
    check( *board, size )
    if board.include?( 0 ) == false then
      puts "Game-Board is Full!"
      puts "Game Over"
      if gets then
        exit
      end
    end
    puts "\e[H\e[2J"
    return *board#いらない？
  end
end

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
    puts "\e[H\e[2J"
    puts "Winner : Player1!"
    if gets then
      exit
    end
  elsif num == size * ( -1 ) then
    puts "\e[H\e[2J"
    puts "Winner : Player2!"
    if gets then
      exit
    end
  end
end

def check( *array, size )
  #横
  0.upto( size - 1 ) do |i|
    num = 0
    0.upto( size - 1 ) do |j|
      num += array[ i * size + j ]
    end
    result( num, size ) 
  end
  #縦
  0.upto( size - 1 ) do |i|
    num = 0
    0.upto( size - 1 ) do |j|
      num += array[ i + size * j ]
    end
    result( num, size )
  end
  #斜め\
  num = 0
  0.upto( size - 1 ) do |i|
      num += array[ size * i + i ]
  end
  result( num, size )
  #斜め /
  num = 0
  0.upto( size - 1 ) do |i|
      num += array[ size * i + ( size - 1 - i )]
  end
  result( num, size )
end

puts "Welcome to OX Game!\n"
puts "Please Enter the Name of Player1 > "
name1 = gets.chomp
p1 = Player.new( name1 )
puts "Please Enter the Name of Player2 > "
name2 = gets.chomp
p2 = Player.new( name2 )
puts "Please Enter the Size of Game-Board > "
size = gets.chomp.to_i

puts "Game Start!"

if gets then
  puts "\e[H\e[2J"
end

board = Array.new( size ** 2, 0 )

while true do
  board = p1.tern( *board, size, 1 )
  board = p2.tern( *board, size, -1 )
end