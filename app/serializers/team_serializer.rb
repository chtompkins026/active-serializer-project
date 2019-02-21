class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_points
  has_many :players
  
  # only showing what we want so you can have different serializations based on access level
end
