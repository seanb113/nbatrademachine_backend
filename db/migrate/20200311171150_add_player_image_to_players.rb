class AddPlayerImageToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :player_image, :string
  end
end
