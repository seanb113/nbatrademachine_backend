class UpdateForeignKeyTrades < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :trades, :users
    add_foreign_key :trades, :users, on_delete: :cascade
  end
end
