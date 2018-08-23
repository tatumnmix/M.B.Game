class Checker
  def self.check(*board, size)
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
  def self.result(num, size)
    if num == size then
      Screen.clear_screen
      puts "Winner : Player1!"
      exit if gets
    elsif num == size * (-1) then
      Screen.clear_screen
      puts "Winner : Player2!"
      exit if gets
    end
  end
  def self.board_status(*board)
    unless board.include?(0)
      puts "Game-Board is Full!"
      puts "Game Over"
      exit if gets
    end
  end  
  def self.check_widthwise(*board, repeat_time, size)
    (0..repeat_time).each do |i|
      num = 0
      (0..repeat_time).each do |j|
        num += board[i * size + j]
      end
      result(num, size) 
    end
  end
  def self.check_lengthwise(*board, repeat_time, size)
    (0..repeat_time).each do |i|
      num = 0
      (0..repeat_time).each do |j|
        num += board[i + size * j]
      end
      result(num, size) 
    end
  end
  def self.check_left_slanting(*board, repeat_time, size)
    num = 0
    (0..repeat_time).each do |i|
      num += board[size * i + i]
    end
    result(num, size)
  end
  def self.check_right_slanting(*board, repeat_time, size)
    num = 0
    (0..repeat_time).each do |i|
      num += board[size * i + (size - 1 - i)]
    end
    result(num, size)
  end
end

