class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_points
  has_many :players
  belongs_to :user

  def self.serialize(team)

      # start with the open brace to create a valid JSON object
      serialized_team= '{'

      serialized_team+= '"id": ' + team.id.to_s + ', '
      serialized_team+= '"name": "' + team.name + '", '
      serialized_team+= '"total_points": "' + team.total_points + '", '

      # the author association can also be represented in JSON
      serialized_team+= '"User": {'
      serialized_team+= '"user_id": "' + team.user.id + '"}'

      # and end with the close brace
      serialized_team+= '}'
    end
end
