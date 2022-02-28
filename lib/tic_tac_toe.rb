class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2],[3,4,5],[6,7,8],
        [0,3,6],[1,4,7],[2,5,8],
        [0,4,8],[2,4,6]
    ]

    def initialize 
        @board = 
        [" ", " ", " ",
         " ", " ", " ",
         " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(str)
        str.to_i - 1
    end

    def move(i, token)
        @board[i] = token
    end

    def position_taken?(i)
        @board[i] == ' ' ? false : true
    end

    def valid_move?(i)
        i > -1 && i < 10 && !position_taken?(i) ? true : false
    end

    def turn_count
        (@board.count(' ') - 9).abs
    end

    def current_player
        turn_count % 2 == 0 ? 'X' : 'O'
    end

    def turn
        puts "Please enter a number 1-9"
        num = gets.strip
        num = input_to_index(num)
        if valid_move?(num)
            move(num, current_player)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |pattern|
          if position_taken?(pattern[0]) && @board[pattern[0]] == @board[pattern[1]] && @board[pattern[1]] == @board[pattern[2]]
            return pattern
          end
        end
    end

    def full?
        !@board.any? {|v| v == " "} ? true : nil
    end

    def draw?
        full? && !won? ? true : false
    end

    def over?
        won? || draw?
    end

    def winner
        won? ? @board[won?[0]] : nil
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
      end
end