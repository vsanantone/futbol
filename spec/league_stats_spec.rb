require_relative 'spec_helper'
require './lib/game'
require './lib/team'
require './lib/game_teams'
require './lib/league_stats'

describe LeagueStats do
  game_path = './data/games.csv'
  team_path = './data/teams.csv'
  game_teams_path = './data/game_teams.csv'

  data = {
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
  }
  let(:league_stats) {league_stats = LeagueStats.new(data)}
  describe "#initialize" do 
    it "exists" do
      expect(league_stats).to be_a(LeagueStats)
    end

    it "has readable array of game objects" do
      expect(league_stats.games).to all be_a(Game)
    end

    it "has readable array of team objects" do
      expect(league_stats.teams).to all be_a(Team)
    end

    it "has readable array of game_team objects" do
      expect(league_stats.game_teams).to all be_a(GameTeam)
    end
  end

  describe "#count_of_teams" do
    it "returns total number of teams as int" do
      expect(league_stats.count_of_teams).to eq(32)
    end
  end

  describe "#best_offense" do 
    it "returns team name with highest average goals per game across all seasons" do
      expect(league_stats.best_offense).to eq("Reign FC")
    end
  end

  describe "#worst_offense" do
    it "returns team name with lowest average goals per game across all seasons" do
      expect(league_stats.worst_offense).to eq "Utah Royals FC"
    end
  end

  describe "#highest_scoring_visitor" do
    it "returns name of the team with the highest average score per game across all seasons when they are away" do
      expect(league_stats.highest_scoring_visitor).to eq "FC Dallas"
    end
  end

  describe "#team_info" do
    it "returns the info for the team specified by team_id" do
      expect(league_stats.team_info("1")).to eq blah
    end
  end
end