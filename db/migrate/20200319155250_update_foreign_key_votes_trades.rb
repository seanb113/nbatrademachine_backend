class UpdateForeignKeyVotesTrades < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :votes, :trades
    add_foreign_key :votes, :trades, on_delete: :cascade
  end
end
