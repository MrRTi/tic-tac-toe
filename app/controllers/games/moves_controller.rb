module Games
  class MovesController < Games::ApplicationController
    def create
      game.moves.create!(**move_params)

      if win?(game)
        game.finish!
      elsif draw?(game)
        game.draw!
      end

      redirect_to game_path(game)
    end

    private

    def move_params
      params.require(:row)
      params.require(:column)
      params.require(:symbol)

      params.permit(:row, :column, :symbol)
    end

    def win?(game)
      moves = game.moves
      board = BoardService.new(moves).call
      return false if board.blank?

      current_symbol = moves.last.symbol
      BoardCheckService.new(board).win?(current_symbol)
    end

    def draw?(game)
      game.moves.count >= game.board_size
    end
  end
end
