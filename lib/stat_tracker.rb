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
end