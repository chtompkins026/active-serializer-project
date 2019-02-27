class Player < ApplicationRecord
  belongs_to :team, optional: true

  validates_uniqueness_of :name, scope: :team_id, message: " can not be a duplicate of someone already on your team"
end
