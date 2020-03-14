class RemoveSwapsFromTrades < ActiveRecord::Migration[6.0]
  def change
    remove_column :trades, :swaps, :text
  end
end
