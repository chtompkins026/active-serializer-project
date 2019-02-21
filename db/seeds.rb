require 'faker'

  User.destroy_all
  Team.destroy_all
  Player.destroy_all


10.times do
  team = Team.create!({name:Faker::Name.name, total_points:Faker::Number.number(3)})
  12.times do
    Player.create!({name:Faker::Name.name, position:'PG', nba_team:Faker::Team.name, points:Faker::Number.number(2), team_id: team.id})
  end
end

# ! creates an error
