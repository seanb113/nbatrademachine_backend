class AddTeamToSwap < ActiveRecord::Migration[6.0]
  def change
    add_reference :swaps, :team, null: false, foreign_key: true
  end
end
