class Games::ApplicationController < ApplicationController
  private

  def game
    @game ||= Game.find(params[:game_id])
  end
end
