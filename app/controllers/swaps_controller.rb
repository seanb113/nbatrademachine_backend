class SwapsController < ApplicationController
  def create
  end

  def index
    all_swaps = Swap.all
      render json: all_swaps.to_json(
        {:except => [:created_at, :updated_at]}
        )
  end
end
