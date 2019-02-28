class PlayerTeam < ApplicationRecord
  belongs_to :team
  belongs_to :player

  validates_uniqueness_of :player_id, scope: :team_id, message: "can not be a duplicate of someone already on your team"
end
