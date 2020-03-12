class ChangeTradeClauseToBooleanInPlayers < ActiveRecord::Migration[6.0]
  def change
    change_column :players, :trade_clause, 'boolean USING CAST(trade_clause AS boolean)'
  end
end
