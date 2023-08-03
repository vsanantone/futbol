require_relative 'game'
require 'csv'

class GameStats
  attr_reader :games,
              :counter

  def initialize(data)
    @data = CSV.parse (File.read(data[:games])), headers: true, header_converters: :symbol
    @games = []
    build_games(@data)
  end

  def build_games(data)
    data.each do |row|
      @games << Game.new(row)
    end
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
    percent = @games.find_all do |game|

      game.home_goals + game.away_goals  
    end
    ((percent.length.to_f) / (@games.length.to_f)).round(2)
  end

  def average_goals_per_game
  end
    
  def average_goals_by_season
  end
end