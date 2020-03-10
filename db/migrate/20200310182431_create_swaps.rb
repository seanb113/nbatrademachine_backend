class CreateSwaps < ActiveRecord::Migration[6.0]
  def change
    create_table :swaps do |t|
      t.references :trade, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
