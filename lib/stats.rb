require 'csv'
require 'game'
require 'team'
require 'game_teams'

class Stats 
  attr_reader :games, :teams, :game_teams

  def build_games(data)
    games = []
    info = CSV.parse (File.read(data[:games])), headers: true, header_converters: :symbol
    info.each do |row|
      games << Game.new(row)
    end
    games
  end

  def build_teams(data)
    teams = []
    team_info = CSV.parse (File.read(data[:teams])), headers: true, header_converters: :symbol
    team_info.each do |row|
      teams << Team.new(row)
    end
    teams
  end

  def build_game_teams(data)
    game_teams = []
    game_teams_info = CSV.parse (File.read(data[:game_teams])), headers: true, header_converters: :symbol
    game_teams_info.each do |row|
      game_teams << GameTeam.new(row)
    end
    game_teams
  end
  
end