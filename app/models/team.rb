class Team < ApplicationRecord
  has_many :players
  has_many :comments
  belongs_to :user 
end
