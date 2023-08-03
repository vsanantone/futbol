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
    expect(team_stats).to be_a(Team_Stats)
  end

  it "reads in CSVs and creates team stats objects" do
    expect(team_stats.teams_data).to all be_a(CSV::Row)
    expect(team_stats.game_teams_data).to all be_a(CSV::Row)
  end
end