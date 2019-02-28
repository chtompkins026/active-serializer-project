class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_points
  has_many :players
  belongs_to :user

end
