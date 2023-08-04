require 'csv'
require_relative 'game'
require_relative 'team'
require_relative 'game_teams'

class LeagueStats
  attr_reader :games, :teams, :game_teams

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

end