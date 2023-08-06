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
    xit "exists" do
      expect(team_stats).to be_an_instance_of(Team_Stats)
    end

    xit "reads in CSVs and creates team stats objects" do
      expect(team_stats.teams_data).to all be_a(CSV::Row)
      expect(team_stats.game_teams_data).to all be_a(CSV::Row)
    end
  end

  describe "#get_team_stats" do
    xit "returns team statistics based on the team_id" do
      team1 = team_stats.teams.sample
      team_id = team1.id
      stats = team_stats.get_team_stats(team_id)

      expect(stats[:team_name]).to be_a String
      expect(stats[:wins]).to be_an Integer
      expect(stats[:losses]).to be_an Integer
      expect(stats[:shots_on_goal]).to be_an Integer
      expect(stats[:total_goals]).to be_an Integer
    end
  end

  describe "#find_by_id" do
    xit "returns a Team object based on the team_id" do
      team1 = team_stats.teams.sample
      team_id = team1.id
      # team = team_stats.find_by_id(team_id)

      expect(team1).to be_an_instance_of(Team)
    end
  end
end