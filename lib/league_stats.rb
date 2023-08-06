require 'csv'
require_relative 'stats'
require_relative 'game'
require_relative 'team'
require_relative 'game_teams'

class LeagueStats < Stats
  attr_reader :games, :teams, :game_teams

  def initialize(data)
    @games = build_games(data)
    @teams = build_teams(data)
    @game_teams = build_game_teams(data)
  end

  def count_of_teams
    @teams.count
  end

  def best_offense
    avg_goals = average_team_goals_all_seasons(team_goals_hash, games_per_team)
    best_offense = avg_goals.max_by do |team, avg|
      avg
    end
    best_team = find_team_by_id(best_offense[0])
    best_team.name
  end

  def worst_offense
    avg_goals = average_team_goals_all_seasons(team_goals_hash, games_per_team)
    worst_offense = avg_goals.min_by do |team, avg|
      avg
    end
    worst_team = find_team_by_id(worst_offense[0])
    worst_team.name
  end

  def highest_scoring_visitor
    avg_goals_visiting = average_team_goals_all_seasons(team_goals_hash('visitor'), games_per_team('visitor'))
    best_visitor = avg_goals_visiting.max_by do |team, avg|
      avg
    end
    best_team_visiting = find_team_by_id(best_visitor[0])
    best_team_visiting.name
  end

  def highest_scoring_home_team
    avg_goals_home = average_team_goals_all_seasons(team_goals_hash('home'), games_per_team('home'))
    best_home_team = avg_goals_home.max_by do |team, avg|
      avg
    end
    best_team = find_team_by_id(best_home_team[0])
    best_team.name
  end

  def lowest_scoring_visitor
    avg_goals_visiting = average_team_goals_all_seasons(team_goals_hash('visitor'), games_per_team('visitor'))
    worst_visitor = avg_goals_visiting.min_by do |team, avg|
      avg
    end
    worst_team_visiting = find_team_by_id(worst_visitor[0])
    worst_team_visiting.name
  end

  def lowest_scoring_home_team
    avg_goals_home = average_team_goals_all_seasons(team_goals_hash('home'), games_per_team('home'))
    worst_home_team = avg_goals_home.min_by do |team, avg|
      avg
    end
    worst_team = find_team_by_id(worst_home_team[0])
    worst_team.name
  end

  def team_info(team_id)
    team = find_team_by_id(team_id)
    info = {
      team_id: team.id,
      franchise_id: team.franchise_id,
      team_name: team.name,
      abbreviation: team.abbreviation,
      link: team.link
    }
    info
  end

  def average_team_goals_all_seasons(goals_hash, games_hash)
    avg_goals = Hash.new
    goals_hash.each do |team, goals|
      avg_goals[team] = goals.to_f / games_hash[team].to_f
    end
    avg_goals
  end

  def team_goals_hash(home_away_all='all')
    if home_away_all == 'all'
      team_goals = Hash.new(0)
      @game_teams.each do |game|
        team_goals[game.team_id] += game.goals.to_i
      end
    elsif home_away_all == 'visitor'
      team_goals = Hash.new(0)
      @game_teams.each do |game|
        team_goals[game.team_id] += game.goals.to_i if game.hoa == 'away'
      end
    elsif home_away_all == "home"
      team_goals = Hash.new(0)
      @game_teams.each do |game|
        team_goals[game.team_id] += game.goals.to_i if game.hoa == 'home'
      end
    end
    team_goals
  end

  def games_per_team(home_away_all='all')
    if home_away_all == 'all'
      team_game_count = Hash.new(0)
      @game_teams.each do |game|
        team_game_count[game.team_id] += 1
      end
    elsif home_away_all == 'visitor'
      team_game_count = Hash.new(0)
      @game_teams.each do |game|
        team_game_count[game.team_id] += 1 if game.hoa == 'away'
      end
    elsif home_away_all == 'home'
      team_game_count = Hash.new(0)
      @game_teams.each do |game|
        team_game_count[game.team_id] += 1 if game.hoa == 'home'
      end
    end
    team_game_count
  end

  def find_team_by_id(id)
    @teams.find do |team|
      team.id == id
    end
  end
end