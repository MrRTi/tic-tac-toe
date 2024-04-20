class GamesController < ApplicationController
  GAMES_LIST_LIMIT = 5

  def index
    @games = Game.order(created_at: :desc).limit(GAMES_LIST_LIMIT)
  end

  def show
    @game = Game.find(params[:id])
    moves = @game.moves
    @board = BoardService.new(moves, max_rows: @game.max_rows, max_columns: @game.max_columns).call

    last_move_symbol = moves.last&.symbol
    @next_symbol = next_symbol(last_move_symbol)
    @winner_symbol = @game.finished? && last_move_symbol
  end

  def create
    game = Game.create
    redirect_to game_path(game)
  end

  private

  def next_symbol(last_move_symbol)
    last_move_symbol == Move::O_SYMBOL ? Move::X_SYMBOL : Move::O_SYMBOL
  end
end
