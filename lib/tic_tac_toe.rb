require "pry"
class TicTacToe
    WIN_COMBINATIONS = [
            [0,1,2],
            [3,4,5],
            [6,7,8],

            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]
    ]

    def initialize
        @board = [" ", " "," ", " ", " "," "," ", " ", " ",]
    end

    def display_board
        puts "#{@board[0]} | #{@board[1]} | #{@board[2]} |"
        puts "----------------"
        puts "#{@board[3]}| #{@board[4]} | #{@board[5]}|"
        puts "-----------------"
        puts "#{@board[6]} | #{@board[7]} | #{@board[8]}|"
    end

    def input_to_index
        input.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
       index >= 0 && index <= 8 && !position_taken?(index)
    end

    def turn_count
       # @board.count("X") + @board.count("O") or
       @board.count {|position| position != " "}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "enter 1 - 9"
       input = input_to_index(gets)

       if valid_move?(index)
        move(index, current_player)
        display_board
       else
        turn
       end
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            if  @board[combo[0]] == @board[combo[1]] &&
                @board[combo[1]] == @board[combo[2]] &&
                position_taken?(@board[combo[0]])
                return combo
            end
        end
    end

    def full?
        @board.all? do |index|
        index != " "
      end
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
    won? ? @board[won?[0]] : nil
    end

    def play
        turn until over?
        puts winner ? "Congraulations #{winner}!" : "Cat's Game!"
    end

end #end of class
