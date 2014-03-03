require 'pry'
require 'shotgun'
require 'sinatra'

game_array =
[
  {
    home_team: "Patriots",
    away_team: "Broncos",
    home_score: 7,
    away_score: 3
  },
  {
    home_team: "Broncos",
    away_team: "Colts",
    home_score: 3,
    away_score: 0
  },
  {
    home_team: "Patriots",
    away_team: "Colts",
    home_score: 11,
    away_score: 7
  },
  {
    home_team: "Steelers",
    away_team: "Patriots",
    home_score: 7,
    away_score: 21
  }
]

team_hash = {}
game_array.each do |game| #loop through each game
    if !team_hash.has_key?(game[:home_team]) #find out if team_hash exists for home_team
      team_hash[game[:home_team]] = {} #creates hash for team
      team_hash[game[:home_team]][:wins] = 0 #creates wins key and sets value to 0
      team_hash[game[:home_team]][:losses] = 0
    else !team_hash.has_key?(game[:away_team])
      team_hash[game[:away_team]] = {}
      team_hash[game[:away_team]][:wins] = 0
      team_hash[game[:away_team]][:losses] = 0
    end
  end

game_array.each do |game|
    if team_hash.has_key?(game[:home_team])
      if game[:home_score] > game[:away_score]
        team_hash[game[:home_team]][:wins] += 1
        team_hash[game[:away_team]][:losses] += 1
      else
        team_hash[game[:home_team]][:losses] += 1
        team_hash[game[:away_team]][:wins] += 1
      end
    end
  end

before do
  @team_hash = team_hash
end

get '/' do
  erb :index
end

get '/leaderboard' do
  erb :leaderboard
end

