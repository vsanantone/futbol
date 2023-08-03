require "./lib/team.rb"
require "csv"

class Team_Stats
  attr_reader :teams_data, :game_teams_data

  def initialize(data_hash)
    @teams_data = load_csv(data_hash[:teams])
    @game_teams_data = load_csv(data_hash[:game_teams])
  end

  def get_team_stats(team_id)
    team_stats = {
      team_name: nil,
      wins: 0,
      losses: 0,
      shots_on_goal: 0,
      total_goals: 0
    }

    team = find_by_id(team_id)

    relevant_game_teams = @game_teams_data.select { |game_team| game_team[:team_id] == team_id }

    relevant_game_teams.each do |game_team|
      if game_team[:result] == 'WIN'
        team_stats[:wins] += 1
      elsif game_team[:result] == 'LOSS'
        team_stats[:losses] += 1
      end

      team_stats[:shots_on_goal] += game_team[:shots].to_i
      team_stats[:total_goals] += game_team[:goals].to_i
    end
    team_stats[:team_name] = team.name
    team_stats
  end

  def load_csv(file_path)
    CSV.read(file_path, headers: true, header_converters: :symbol)
  end

  def find_by_id(team_id)
    team_data = @teams_data.find do |team|
      team[:team_id] == team_id
    end
  end
end