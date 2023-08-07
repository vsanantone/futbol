require_relative 'game'
require 'csv'

class GameStats
  attr_reader :games,
              :counter

  def initialize(data)
    @games = build_games(data)
  end

  def build_games(data)
    games = []
    info = CSV.parse (File.read(data[:games])), headers: true, header_converters: :symbol
    info.each do |row|
      games << Game.new(row)
    end
    games
  end

  def highest_total_score
    max = @games.max_by do |game|
      game.away_goals + game.home_goals
    end
    max.away_goals + max.home_goals
  end

  def lowest_total_score
    max = @games.min_by do |game|
      game.away_goals + game.home_goals
    end
    max.away_goals + max.home_goals
  end

  def percentage_home_wins
    # wins = []
    #   percent = @games.each do |game|
    #     if game.home_goals > game.away_goals
    #       wins << game.home_goals
    #     end
    #   end
    #   x = (wins.length.to_f) / (@games.length.to_f)
    #   x.round(2)
    percent = @games.find_all do |game|
      game.home_goals > game.away_goals  
    end
    ((percent.length.to_f) / (@games.length.to_f)).round(2)
    # x = (percent.length.to_f) / (@games.length.to_f)
    # x.round(2)
  end

  def percentage_visitor_wins
    percent = @games.find_all do |game|

      game.home_goals < game.away_goals  
    end
    ((percent.length.to_f) / (@games.length.to_f)).round(2)
  end
  
  def percentage_ties
    percent = @games.find_all do |game|

      game.home_goals == game.away_goals  
    end
    ((percent.length.to_f) / (@games.length.to_f)).round(2)
  end

  def average_goals_per_game
    goals = @games.sum do |game|
      game.home_goals + game.away_goals
    end
    average_goals_formated(goals, @games.count)
  end
    
  def average_goals_by_season
    games_per_season = count_of_games_by_season
    goals_per_season = Hash.new(0)
    @games.each do |game|
    goals_per_season[game.season] += (game.away_goals + game.home_goals)
    end
    {
      "20122013" => average_goals_formated(goals_per_season["20122013"], games_per_season["20122013"]),
      "20132014" => average_goals_formated(goals_per_season["20132014"], games_per_season["20132014"]),
      "20142015" => average_goals_formated(goals_per_season["20142015"], games_per_season["20142015"]),
      "20152016" => average_goals_formated(goals_per_season["20152016"], games_per_season["20152016"]),
      "20162017" => average_goals_formated(goals_per_season["20162017"], games_per_season["20162017"]),
      "20172018" => average_goals_formated(goals_per_season["20172018"], games_per_season["20172018"])
    }
  end

  def count_of_games_by_season
    games_per_season = Hash.new(0)
    @games.each do |game|
      games_per_season[game.season] += 1
    end
    games_per_season
  end

  def average_goals_formated(goals, games)
    (goals.to_f / games.to_f).round(2)
  end
end