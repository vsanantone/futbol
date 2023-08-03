require_relative 'game'
require 'csv'

class GameStats
  attr_reader :games

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
end