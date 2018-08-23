require './player'
require './checker'
require './screen'
require './game'

puts "Welcome to OX Game!\n"

name1, name2, size = Player.setup

puts "Game Start!"

Screen.clear_screen if gets

board = Array.new(size**2, 0)
game = Game.new

while true do
  board = game.turn(*board, size, 1, name1)
  board = game.turn(*board, size, -1, name2)
end