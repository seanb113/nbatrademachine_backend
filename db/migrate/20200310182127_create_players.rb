class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.string :year_signed
      t.string :signed_using
      t.string :trade_clause
      t.string :trade_kicker

      t.timestamps
    end
  end
end
