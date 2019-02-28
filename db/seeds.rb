require 'faker'

  User.destroy_all
  Team.destroy_all
  Player.destroy_all
  Comment.destroy_all

  user1 = User.create!({name: 'Chris', password:'password', email:'chtompkins026@gmail.com'})
  user2 = User.create!({name: 'Jason Tompkins', password:'password1', email:'chtompkins027@gmail.com'})
  user3 = User.create!({name: 'Jason Wang', password:'password1', email:'chtompkins0299@gmail.com'})
  user4 = User.create!({name: 'Jason Lazzaros', password:'password1', email:'chtompkins028@gmail.com'})

10.times do
  team = Team.create!({name:Faker::Name.name, total_points:Faker::Number.number(3), user:user1})
  12.times do
    Player.create!({name:Faker::Name.name, position:'PG', nba_team:Faker::Team.name, points:Faker::Number.number(2), team_id: team.id})
  end
end

10.times do
  comment = Comment.create!({title: Faker::Book.title, description: Faker::TvShows::Community.quotes, user: user1})
end

# ! creates an error
