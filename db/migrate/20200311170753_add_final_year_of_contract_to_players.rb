class AddFinalYearOfContractToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :final_year_of_contract, :string
  end
end
