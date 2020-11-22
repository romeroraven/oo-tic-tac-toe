class TicTacToe
  
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
      
      def initialize
          @board = [" ", " ", " ", " ", " ", " ", " ", " ", " " ]
      end
      
      def display_board
          puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
          puts "-----------"
          puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
          puts "-----------"
          puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        end

        def input_to_index(input)
            index = input.to_i - 1
        end

        def move(index, play_token = "X")
            @board[index] = play_token
        end

        def position_taken?(index)
            @board[index] != " "
        end

        def valid_move?(index)
            index.between?(0,8) && !position_taken?(index)
        end
        
        def turn_count
            @board.count {|space| space == "X" || space == "O"}
        end

        def current_player
            turn_count.even? ? "X" : "O"
        
        end

        def turn
            index = input_to_index(gets.chomp)
            if valid_move?(index)
                move(index, current_player)
                display_board
            else
                turn
            end
        end

        def won?

            x_indexes = []
            o_indexes = []
            winner = false
            @board.each_with_index do |value, index|
                if value == "X"
                    x_indexes << index
                elsif value == "O"
                    o_indexes << index
                end
            end

            WIN_COMBINATIONS.each do |winning_array|
                if(winning_array - x_indexes).empty?
                    winner = winning_array
                    @winning_player = "X"
                    elsif (winning_array - o_indexes).empty?
                        winner = winning_array
                        @winning_player = "O"
                    end
                end

                return winner
            end

            def full?
                unless @board.include?(" ")
                    return true
                end
            end

            def draw?
                full? && !won?
            end
            
            def over?
                if draw? || won?
                    true
                    elsif full? == false
                        false
                    end
                end

                def winner
                    won?
                    return @winning_player
                end

                def play 
                    turn until over?
                    if won?
                        puts "Congratulations #{@winning_player}!"
                        elsif draw?
                            puts "Cat's Game!"
                        end
                    end
                end
            


 


