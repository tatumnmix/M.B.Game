#require './player'
#require './checker'
#require './screen'
require './game'

game = Game.new


Game.welcome_message

name1, name2, size = Player.setup

Game.start_message

Screen.clear_screen if gets

board = Array.new(size**2, 0)

while true do
  board = game.turn(*board, size, 1, name1)
  board = game.turn(*board, size, -1, name2)
end