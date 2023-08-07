require_relative 'spec_helper'
require './lib/stats'

describe Stats do
  game_path = './data/games.csv'
  team_path = './data/teams.csv'
  game_teams_path = './data/game_teams.csv'

  data_hash = {
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
  }
  let(:stats) {stats = Stats.new(data_hash)}
  describe "#initialize" do
    it "exists" do
      expect(stats).to be_a(Stats)
    end

    it "has readable @games att" do
      expect(stats.games).to all be_a(Game)
    end

    it "has readable @teams att" do 
      expect(stats.teams).to all be_a(Team)
    end

    it "has readable @game_teams att" do
      expect(stats.game_teams).to all be_a(GameTeam)
    end
  end

  describe "#build_games" do
    it "builds an array of game objects" do
      expect(stats.build_games(data_hash)).to all be_a(Game)
    end
  end

  describe "#build_teams" do 
    it "builds an array of team objects" do 
      expect(stats.build_teams(data_hash)).to all be_a(Team)
    end
  end

  describe "#build_game_teams" do 
    it "builds and array of game_teams objects" do
      expect(stats.build_game_teams(data_hash)).to all be_a(GameTeam)
    end
  end
end