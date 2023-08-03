require_relative 'spec_helper'
require "./lib/team.rb"
require "./lib/team_stats.rb"


RSpec.describe Team_Stats do
  teams_path = './data/teams.csv'
  game_teams_path = './data/game_teams.csv'

  data_hash = {
    teams: teams_path,
    game_teams: game_teams_path
  }
  
  let(:team_stats) { Team_Stats.new(data_hash) }

  describe "#initialize" do
  it "exists" do
    expect(team_stats).to be_an_instance_of(Team_Stats)
  end

  it "reads in CSVs and creates team stats objects" do
    expect(team_stats.teams_data).to all be_a(CSV::Row)
    expect(team_stats.game_teams_data).to all be_a(CSV::Row)
  end

  describe "#get_team_stats" do
    it "returns team statistics based on the team_id" do
      team_id = 4
      stats = team_stats.get_team_stats(team_id)

      expect(stats[:wins]).to eq(1)
    end
  end
end
end