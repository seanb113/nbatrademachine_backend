class Trade < ApplicationRecord
  belongs_to :user
  has_many :swaps
  has_many :players, through: :swaps
  has_many :teams, through: :swaps
  accepts_nested_attributes_for :swaps
end
