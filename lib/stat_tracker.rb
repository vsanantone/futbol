require_relative 'game'
require_relative 'team'
require_relative 'game_teams'
require_relative 'game_stats'
require_relative 'league_stats'
require 'csv'

class StatTracker

  def self.from_csv(data)
    StatTracker.new(data)
  end

  def initialize(data)
    @game_stats = GameStats.new(data)
    # @team_stats = TeamStats.new(data)
    @league_stats = LeagueStats.new(data)
    # @season_stats = SeasonStats.new(data)
  end

  def highest_total_score
    @game_stats.highest_total_score
  end

  def lowest_total_score
    @game_stats.lowest_total_score
  end

  def percentage_home_wins
    @game_stats.percentage_home_wins
  end

  def percentage_visitor_wins
    @game_stats.percentage_visitor_wins
  end

  def percentage_ties
    @game_stats.percentage_ties
  end

  def count_of_games_by_season
    @game_stats.count_of_games_by_season
  end

  def average_goals_per_game
    @game_stats.average_goals_per_game
  end

  def average_goals_by_season
    @game_stats.average_goals_by_season
  end

  def count_of_teams
    @league_stats.count_of_teams 
  end

  def best_offense
    @league_stats.best_offense 
  end

  def worst_offense
    @league_stats.worst_offense 
  end

  def highest_scoring_visitor
    @league_stats.highest_scoring_visitor 
  end

  def highest_scoring_home_team
    @league_stats.highest_scoring_home_team 
  end

  def lowest_scoring_visitor
    @league_stats.lowest_scoring_visitor 
  end

  def lowest_scoring_home_team
    @league_stats.lowest_scoring_home_team 
  end

  def team_info(team_id) 
    @league_stats.team_info(team_id) 
  end
end