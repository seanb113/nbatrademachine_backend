class AddPlayerPicToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :player_pic, :string
  end
end
