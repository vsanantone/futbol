require 'csv'
require_relative 'game'
require_relative 'team'
require_relative 'game_teams'

class LeagueStats
  attr_reader :games, :teams, :game_teams

  def initialize(data)
    @games = build_games(data)
    @teams = build_teams(data)
    @game_teams = build_game_teams(data)
  end

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

  def count_of_teams
    @teams.count
  end

  def best_offense
    avg_goals = average_team_goals_all_seasons
    best_offense = avg_goals.max_by do |team, avg|
      avg
    end
    best_team = find_team_by_id(best_offense[0])
    best_team.name
  end

  def worst_offense
    avg_goals = average_team_goals_all_seasons
    worst_offense = avg_goals.min_by do |team, avg|
      avg
    end
    worst_team = find_team_by_id(worst_offense[0])
    worst_team.name
  end

  def average_team_goals_all_seasons
    goals_hash = team_goals_hash
    games_hash = games_per_team
    avg_goals = Hash.new
    goals_hash.each do |team, goals|
      avg_goals[team] = goals.to_f / games_hash[team].to_f
    end
    avg_goals
  end

  def team_goals_hash
    team_goals = Hash.new(0)
    @game_teams.each do |game|
      team_goals[game.team_id] += game.goals.to_i
    end
    team_goals
  end

  def games_per_team
    team_game_count = Hash.new(0)
    @game_teams.each do |game|
      team_game_count[game.team_id] += 1
    end
    team_game_count
  end

  def find_team_by_id(id)
    @teams.find do |team|
      team.id == id
    end
  end

end