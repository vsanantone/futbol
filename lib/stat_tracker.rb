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
    @game_teams.percentage_ties
  end

  def count_of_games_by_season
    @games_teams.count_of_games_by_season
  end
end