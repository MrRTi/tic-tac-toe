module Games
  class MovesController < Games::ApplicationController
    def create
      game.moves.create!(**move_params)

      if game_finished?(game)
        game.finish!
        # TODO: Add victory screen, need to pass win combination
      elsif game_draw?(game)
        game.draw!
        # TODO: Add draw screen
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

    def game_finished?(game)
      moves = game.moves
      board_params = { max_rows: game.max_rows, max_columns: game.max_columns }
      board = BoardService.new(moves, **board_params).call
      return false if board.blank?

      current_symbol = moves.last.symbol
      BoardCheckService.new(board, **board_params).win?(current_symbol)
    end

    def game_draw?(game)
      game.moves.count >= game.board_size
    end
  end
end
