class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :position, :nba_team, :points, :team_id
  has_many :teams
end
