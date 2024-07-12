class LaVieja

  def initialize
    puts "Let's begin the game!!!"
  end

  def player_turn
    print "Enter your move: "
    player_choice = gets.downcase.chomp
    
    player_choice = player_choice.split(",")
    player_choice[0] = player_choice[0].ord - 97
    player_choice[1] = player_choice[1].to_i - 1
    if player_choice[0] >= 3 || player_choice[1]  >=3
      puts "Invalid, please try again"
      player_turn()
    end
    return player_choice
  end

  def full?(board)
    board.each do |line|
      line.each do |spot|
        if spot == " "
          return false
        end
      end
    end
    return true
  end

  def print_board(board)
    board.each_with_index do |line, l_index|
      line.each_with_index do |spot, s_index|
        print "  #{spot.upcase}  "
        unless s_index == 2 
          print "|"
        end
      end
      puts
      unless l_index == 2
        puts "-----------------"
      end
    end
  end

  def winner?(board, now_playing)                 #CHECKKKKKK
    3.times do |i|
      return true if board[i][0] == now_playing && board[i][1] == now_playing && board[i][2] == now_playing
    end
    3.times do |i|
      return true if board[0][i] == now_playing && board[1][i] == now_playing && board[2][i] == now_playing
    end
    return true if board[0][0] == now_playing && board[1][1] == now_playing && board[2][2] == now_playing
    return true if board[0][2] == now_playing && board[1][1] == now_playing && board[2][0] == now_playing
  end

  def play

    puts ""
    print "Choose x or o: "
    now_playing = gets.chomp
    puts "To choose where to place your X or O enter a letter from a to c for the line and number from 1 to 3 for the column"
    puts "For example 'a, 1' for the first column on the first line"
    puts ""

    board = [
             [" ", " ", " "],
             [" ", " ", " "],
             [" ", " ", " "]
            ]

    loop do
      print_board(board)
      puts
      turn = player_turn()
      board_position = board[turn[0]][turn[1]]
      if board_position == " "
        board[turn[0]][turn[1]] = now_playing
      else
        puts "There's already an #{board_position} there, try again"
        player_turn()
      end
      if full?(board)
        puts "It's a TIE"
        break
      elsif winner?(board, now_playing)
        print_board(board)
        puts ""
        puts "#{now_playing} WINS!!"
        break
      end
      if now_playing == "x"
        now_playing = "o"
      else
        now_playing = "x"
      end
    end
  end
end

la_vieja = LaVieja.new
la_vieja.play