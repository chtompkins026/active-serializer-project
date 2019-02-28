class Comment < ApplicationRecord
  belongs_to :user

  scope :sort_by_comment, -> {order("created_at DESC")}
end
