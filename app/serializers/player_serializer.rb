class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :nba_team, :points, :team_id
  belongs_to :players
end
