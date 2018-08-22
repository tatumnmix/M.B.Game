#puts "\e[H\e[2J" ->画面消去

def print_board(*array)
  0.upto(2) do |i|
    0.upto(2) do |j|
      if array[i][j] == 1 then
        print "O"
      elsif array[i][j] == -1 then
        print "X"
      else
        print "Q"
      end
    end
    puts "\n"
  end
end

puts "Welcome to OX Game!\n"
puts "Please Enter the Name of Player1 > "
p1 = gets.chomp
puts "Please Enter the Name of Player2 > "
p2 = gets.chomp

puts "Game Start!"

if gets then
  puts "\e[H\e[2J"
end

board = Array.new(3, Array.new(3, 0) )

print_board(*board)