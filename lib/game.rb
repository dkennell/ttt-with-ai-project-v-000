class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"), 
                 player_2 = Players::Human.new("O"), 
                 board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    @board.full? || won?
  end

  def won?
    ["X","O"].any? do |player|
      WIN_COMBINATIONS.any? do |combo|
        combo.all? do |position|
          @board.cells[position] == player
        end
      end
    end
  end

  def draw?
    over? && !won?
  end

  def winner
    current_player.token if won?
  end

  # def turn
  #  current_player.move
  #  gets.chomp.to_s
  #end
end
