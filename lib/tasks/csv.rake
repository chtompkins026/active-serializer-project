namespace :db do
  task populate: :environment do
    Player.destroy_all
    File.open("FantasyPros_Fantasy_Basketball_Player_Rater.csv", "r") do |f|
      f.readlines.each_with_index do |player, i|
          unless i ==0
            baller = player.strip.gsub('"','').split(",")
            print baller.to_s
            Player.create!(name: baller[1], position: baller[3], nba_team: baller[2], points:baller[-1].to_i)
          else
            next
          end
      end

    end
  end
end
