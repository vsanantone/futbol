require_relative 'game'
require_relative 'team'
require_relative 'game_teams'
require_relative 'game_stats'
require 'csv'

class StatTracker

  def self.from_csv(data)
    StatTracker.new(data)
  end

  def initialize(data)
    @game_stats = GameStats.new(data)
  end

  def highest_total_score
    @game_stats.highest_total_score
  end

  def lowest_total_score
    @game_stats.highest_total_score
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
end