class UpdateForeignKeyPlayers < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :players, :teams

    add_foreign_key :players, :teams, on_delete: :cascade
  end
end
