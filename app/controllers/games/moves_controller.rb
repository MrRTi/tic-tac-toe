module Games
  class MovesController < Games::ApplicationController
    def create
      game.moves.create!(**move_params)
      return redirect_to game_path(game) if game.moves.count < 4

      game.finish! if win?(game)
      game.draw! if game.in_progress? && draw?(game)

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

      BoardCheckService.new(board).win?(move_params[:symbol])
    end

    def draw?(game)
      game.moves.count >= game.board_size
    end
  end
end
