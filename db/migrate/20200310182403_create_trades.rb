class CreateTrades < ActiveRecord::Migration[6.0]
  def change
    create_table :trades do |t|
      t.references :user, null: false, foreign_key: true
      t.text :swaps
      t.text :new_caps

      t.timestamps
    end
  end
end
