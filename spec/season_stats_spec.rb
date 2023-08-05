require_relative 'spec_helper'
require './lib/game_stats'
require './lib/game'
require './lib/season_stats'
require './lib/game_teams'
require './lib/team'
require 'csv'

RSpec.describe SeasonStats do
  game_path = './data/games.csv'
  team_path = './data/teams.csv'
  game_teams_path = './data/game_teams.csv'

  data_hash = {
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
  }
  let(:season_stats) {season_stats = SeasonStats.new(data_hash)}

  it 'exists' do 
    expect(season_stats).to be_a(SeasonStats)
  end

  it "reads in a csv and creates game objects" do
    expect(season_stats.games).to all be_a(Game)
    expect(season_stats.teams).to all be_a(Team)
    expect(season_stats.game_teams).to all be_a(GameTeam)
  end

  describe "#indiv_seasons" do 
    it 'can break out games by season' do 
      expect(season_stats.indiv_season("20122013")).to all be_a(GameTeam)
    end
  end

  describe "#win_or_loss_per_season" do 
    it "can return an array of all game_team objects with the expected result ('WIN'/'LOSS')" do 
      expect(season_stats.win_or_loss_per_season("20122013","WIN")).to all be_a(GameTeam)
      expect(season_stats.win_or_loss_per_season("20122013","LOSS")).to all be_a(GameTeam)
    end
  end

  describe '#winningest_coach' do 
    xit 'returns the name of the coach with the best win percentage for the season' do
      expect(season_stats.winningest_coach("20132014")).to eq("Claude Julien")
    end
  end
  describe '#worst_coach' do 
    xit 'returns the name of the coach with the worst win percentage for the season' do
      expect(season_stats.worst_coach).to be_a(String)
    end
  end
  describe '#most_tackles' do 
    xit 'returns the name of the team with the most tackles for the season' do
      expect(season_stats.most_tackles).to be_a(String)
    end
  end
  describe '#fewest_tackles' do 
    xit 'returns the name of the team with the most tackles for the season' do
      expect(season_stats.most_tackles).to be_a(String)
    end
  end
  describe '#most_accurate_team' do 
    xit 'returns the name of the team with the best ratio of shots to goals for the season' do
      expect(season_stats.most_accurate_team).to be_a(String)
    end
  end
  describe '#least_accurate_team' do 
    xit 'returns the name of the team with the worst ratio of shots to goals for the season' do
      expect(season_stats.least_accurate_team).to be_a(String)
    end

  end
end