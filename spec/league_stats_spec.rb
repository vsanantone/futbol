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

    xit "has readable array of team objects" do
      expect(league_stats.teams).to all be_a(Team)
    end

    xit "has readable array of game_team objects" do
      expect(league_stats.game_teams).to all be_a(GameTeam)
    end
  end
end