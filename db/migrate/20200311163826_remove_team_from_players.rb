class RemoveTeamFromPlayers < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :team, :string
  end
end
