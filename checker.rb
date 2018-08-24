class Checker
  def self.check(*board, size, name)
    repeat_time = size - 1
    #横
    check_widthwise(*board, repeat_time, size, name)
    #縦
    check_lengthwise(*board, repeat_time, size, name)
    #斜め\
    check_left_slanting(*board, repeat_time, size, name)
    #斜め /
    check_right_slanting(*board, repeat_time, size, name)
  end
  
  def self.result(num, size, name)
    if num.abs == size then
      Screen.clear_screen
      puts "Winner : #{name}!"
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
  
  def self.check_widthwise(*board, repeat_time, size, name)
    (0..repeat_time).each do |i|
      num = 0
      (0..repeat_time).each do |j|
        num += board[i * size + j]
      end
      result(num, size, name) 
    end
  end
  
  def self.check_lengthwise(*board, repeat_time, size, name)
    (0..repeat_time).each do |i|
      num = 0
      (0..repeat_time).each do |j|
        num += board[i + size * j]
      end
      result(num, size, name) 
    end
  end
  
  def self.check_left_slanting(*board, repeat_time, size, name)
    num = 0
    (0..repeat_time).each do |i|
      num += board[size * i + i]
    end
    result(num, size, name)
  end
  
  def self.check_right_slanting(*board, repeat_time, size, name)
    num = 0
    (0..repeat_time).each do |i|
      num += board[size * i + (size - 1 - i)]
    end
    result(num, size, name)
  end
end

