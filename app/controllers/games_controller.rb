class GamesController < ApplicationController
  def index
    @games = Game.order(created_at: :desc).limit(5)
  end

  def show
    @game = Game.find(params[:id])

    @board = BoardService.new(@game).call
    @last_move = @game.moves.last
    @next_symbol = @last_move&.symbol == Move::O_SYMBOL ? Move::X_SYMBOL : Move::O_SYMBOL
    @winner_symbol = @game.finished? && @last_move.symbol
  end

  def create
    game = Game.create
    redirect_to game_path(game)
  end
end
