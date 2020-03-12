class RemoveTaxedFromTeams < ActiveRecord::Migration[6.0]
  def change

    remove_column :teams, :taxed, :string
  end
end
