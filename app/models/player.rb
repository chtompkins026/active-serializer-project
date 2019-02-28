class Player < ApplicationRecord
  # belongs_to :team, optional: true
  has_many :player_teams
  has_many :teams, through: :player_teams
end
