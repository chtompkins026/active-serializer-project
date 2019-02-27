class Team < ApplicationRecord
  has_many :players
  belongs_to :user, optional: true

  validates_uniqueness_of :name, message: "Error - this team name is already taken"
  
end
