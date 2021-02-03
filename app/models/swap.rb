class Swap < ApplicationRecord
  belongs_to :trade
  belongs_to :player
  belongs_to :team
end
