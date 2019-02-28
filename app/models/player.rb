class Player < ApplicationRecord
  # belongs_to :team, optional: true
  has_many :player_teams
  has_many :teams, through: :player_teams

  scope :sort_by_player, -> {order("points DESC")}
end
