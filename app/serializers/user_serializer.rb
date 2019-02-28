class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :comments
  has_many :teams 
end
