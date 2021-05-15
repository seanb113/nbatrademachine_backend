class TradesController < ApplicationController
  def index
    all_trades = Trade.all
    
    render json: all_trades.to_json(
      :include => {:swaps =>
    {:except => [:created_at, :updated_at]}}
    )
  end

  def create
    user = User.find_by(id: params[:user]["id"])
    trade = Trade.create(user:user)
    swaps = params[:swap_attributes]
    
    create_swaps(swaps, trade)
    render json: trade.to_json(
      :include => {:swaps =>
      {:except => [:created_at, :updated_at]}}
      )
  end

  def create_swaps(swaps, trade)
   swaps.each do |swapped|
      swapped[1].each{|player| Swap.create(trade_id: trade.id, player_id: player["id"], team_id: swapped[0]["id"])}
    end
  end

  def destroy
    trade = Trade.find_by(id: params[:id])
    trade.destroy
  end
    # trade[0].each do |swapped|
    #   Swap.create(trade_id: trade.id, team_id swapped[0].id, player_id swapped[1].first)
    # end


    # def trade_params
    #   params.require(:user).permit(
    #     :id,
    #     :name,
    #     :team
    #   )
    # end

  # def trade_params
  #   params.require(:user).permit(
  #     :user,
  #     swap_attributes: [
  #     :team,
  #     :player
  # ])
  # end

end