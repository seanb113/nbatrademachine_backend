class RemoveTradeKickerFromPlayers < ActiveRecord::Migration[6.0]
  def change

    remove_column :players, :trade_kicker, :string
  end
end
