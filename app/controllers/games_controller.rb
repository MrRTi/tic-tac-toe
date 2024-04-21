class GamesController < ApplicationController
  GAMES_LIST_LIMIT = 5

  def index
    @games = Game.order(created_at: :desc).limit(GAMES_LIST_LIMIT)
  end

  def show
    @game = Game.find(params[:id])
    @moves = @game.moves
    board_params = { max_rows: @game.max_rows, max_columns: @game.max_columns }
    @board = BoardService.new(@moves, **board_params).call

    last_move_symbol = @moves.last&.symbol
    @next_symbol = next_symbol(last_move_symbol)

    @win_combination = []
    @win_combination = win_combination(@board, board_params, last_move_symbol) if @game.finished?
  end

  def create
    game = Game.create
    redirect_to game_path(game)
  end

  private

  def next_symbol(last_move_symbol)
    return [Move::X_SYMBOL, Move::O_SYMBOL].sample if last_move_symbol.nil?

    last_move_symbol == Move::O_SYMBOL ? Move::X_SYMBOL : Move::O_SYMBOL
  end

  def win_combination(board, board_params, last_move_symbol)
    BoardCheckService.new(board, **board_params).win_combination(last_move_symbol)
  end
end
