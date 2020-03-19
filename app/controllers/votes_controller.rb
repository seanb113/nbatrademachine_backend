class VotesController < ApplicationController
  def index
    all_votes = Vote.all
    render json: all_votes.to_json(
    {:except => [:created_at, :updated_at, :password_digest]}
    )
  end

  def create
    # trade = Trade.find_by(id: params[:trade]["id"])
    # user = User.find_by(id: params[:user]["id"])
    vote = Vote.create(vote_params)
    render json: vote.to_json
  end

  def show
  end

    def vote_params
      params.require(:vote).permit(:user_id, :category, :trade_id)
    end
end
