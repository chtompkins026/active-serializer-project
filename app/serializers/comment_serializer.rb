class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :team_id, :user_id
  belongs_to :user 
end
