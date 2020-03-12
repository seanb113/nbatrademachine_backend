class PlayersController < ApplicationController
  def index
    all_players = Player.all
    render json: all_players.to_json(
    {:except => [:created_at, :updated_at]}
    )
  end

  def create
  end
end
