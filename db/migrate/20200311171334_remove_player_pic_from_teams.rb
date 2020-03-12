class RemovePlayerPicFromTeams < ActiveRecord::Migration[6.0]
  def change

    remove_column :teams, :player_pic, :string
  end
end
