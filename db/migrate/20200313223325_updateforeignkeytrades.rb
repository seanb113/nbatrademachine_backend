class Updateforeignkeytrades < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :swaps, :teams
    remove_foreign_key :swaps, :players
    remove_foreign_key :swaps, :trades
    add_foreign_key :swaps, :teams, on_delete: :cascade
    add_foreign_key :swaps, :players, on_delete: :cascade
    add_foreign_key :swaps, :trades, on_delete: :cascade
  end
end
