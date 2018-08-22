#puts "\e[H\e[2J" ->画面消去

def print_board(*array,size)
  0.upto(size-1) do |i|
    0.upto(size-1) do |j|
      if array[i][j] == 1 then
        print " O "
      elsif array[i][j] == -1 then
        print " X "
      else
        print " Q "
      end
      print "|"
    end
    puts "\n"
  end
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

board = Array.new(size, Array.new(size-1, 0) )

print_board(*board,size)