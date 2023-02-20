

class TicTacToe
    attr_accessor :board
    
    WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
    ]

    def initialize()
        @board =[" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end

    def input_to_index(input)
        input.to_i-1
    end

    def move(position,move="X")
        @board[position]=move
    end

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
            true
        else
            false
        end
    end 

    def valid_move?(index)
        if index > 8 || index < 0
            false
        elsif @board[index] == "X" || @board[index] == "O"
            false
        else
            true
        end
    end 

    def turn_count
        @board.count {|x| x=="X"||x=="O"}
    end 

    def current_player
        if turn_count%2==0
            "X"
        else
            "O"
        end
    end

    def turn
        user_input=gets.chomp
        index=input_to_index(user_input)
        if valid_move?(index) ==true
            @board[index]=current_player
            display_board
        else
            turn
        end

    end

    def won? 

        WIN_COMBINATIONS.any? do |combo|
            if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
              return combo
            end
        end
    end

end