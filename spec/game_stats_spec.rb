require_relative 'spec_helper'
require './lib/game_stats'
require './lib/game'
require 'csv'

describe GameStats do
  game_path = './data/games.csv'
  team_path = './data/teams.csv'
  game_teams_path = './data/game_teams.csv'

  data_hash = {
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
  }
  let(:game_stats) {game_stats = GameStats.new(data_hash)}
  describe "#initialize" do
    it "exists" do

      expect(game_stats).to be_a(GameStats)
    end
    
    it "reads in a csv and creates game objects" do

      expect(game_stats.games).to all be_a(Game)
    end
  end

  describe "#highest_total_score" do
    it "returns the highest combined game score" do

      expect(game_stats.highest_total_score).to eq(11)
    end
  end

  describe "#lowest_total_score" do
    it "returns the lowest combined game score" do

      expect(game_stats.lowest_total_score).to eq(0)
    end
  end

  describe "#percentage_home_wins" do 
    it "returns a percentage representing the ratio that home team wins the game" do

      expect(game_stats.percentage_home_wins).to eq(0.44)
    end
  end

  describe "#percentage_visitor_wins" do
    it "returns the ratio of games won by the visiting team" do

      expect(game_stats.percentage_visitor_wins).to eq(0.36)
    end
  end

  describe "#percentage_ties" do
    it "returns the ratio of games ending in a tie" do
      
      expect(game_stats.percentage_ties).to eq(0.20)
    end
  end

  describe "#average_goals_per_game" do
    it "returns average goals scored per game" do

      expect(game_stats.average_goals_per_game).to eq(4.22)
    end
  end

  describe "#average_goals_by_season" do
    it "returns hash with average goals per game for each season" do
      expected = {
      "20122013"=>4.12,
      "20162017"=>4.23,
      "20142015"=>4.14,
      "20152016"=>4.16,
      "20132014"=>4.19,
      "20172018"=>4.44
    }

      expect(game_stats.average_goals_by_season).to eq(expected)
    end
  end  
end

  