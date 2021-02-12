class TeamsController < ApplicationController
  def index
    all_teams = Team.all
    render json: all_teams.to_json(
    {:except => [:created_at, :updated_at]}
    )
  end
  
  def create 
  end
end
