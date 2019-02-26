class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_points
  has_many :players

  def self.serialize(team)

      # start with the open brace to create a valid JSON object
      serialized_team= '{'

      serialized_team+= '"id": ' + post.id.to_s + ', '
      serialized_team+= '"title": "' + post.title + '", '
      serialized_team+= '"description": "' + post.description + '", '

      # the author association can also be represented in JSON
      serialized_team+= '"author": {'
      serialized_team+= '"name": "' + post.author.name + '"}'

      # and end with the close brace
      serialized_team+= '}'
    end
end
