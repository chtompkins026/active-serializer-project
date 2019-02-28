class Team < ApplicationRecord
  has_many :player_teams
  has_many :players, through: :player_teams
  belongs_to :user, optional: true

  validates_uniqueness_of :name, message: "Error - this team name is already taken"
end
