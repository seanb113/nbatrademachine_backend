class AddCapSpentToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :cap_spent, :string
  end
end
