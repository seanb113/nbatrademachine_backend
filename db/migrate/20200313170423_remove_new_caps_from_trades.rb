class RemoveNewCapsFromTrades < ActiveRecord::Migration[6.0]
  def change
    remove_column :trades, :new_caps, :text
  end
end
