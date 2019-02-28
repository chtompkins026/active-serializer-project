class Comment < ApplicationRecord
  belongs_to :user

  scope :sort_by_comment, -> {order("id DESC")}
end
