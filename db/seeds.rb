require 'faker'

  User.destroy_all
  Team.destroy_all
  Player.destroy_all


10.times do
  Team.create!({name:Faker::Name.name, total_points:Faker::Number.number(3)})
end
