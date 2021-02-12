class AddTaxToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :luxury_tax_space, :string
  end
end
