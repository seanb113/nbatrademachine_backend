class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: true }
    belongs_to :team
    has_many :trades
    has_many :votes
end
