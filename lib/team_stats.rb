require "./lib/team.rb"
require "csv"

class Team_Stats
  attr_reader :teams,
              :teams_data,
              :game_teams_data

  def initialize(data)
    @teams_data = CSV.parse(File.read(data[:teams]), headers: true, header_converters: :symbol)
    @game_teams_data = CSV.parse(File.read(data[:game_teams]), headers: true, header_converters: :symbol)
    @teams = []
    build_teams(@teams_data)
  end

  def build_teams(data)
    data.each do |row|
      @teams << Team.new(id: row[:team_id], name: row[:teamname].to_s)
    end
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
    team_stats[:team_name] = team.name

    relevant_game_teams_data = @game_teams_data.select do |game_team| 
      game_team[:team_id] == team_id
    end
    team_stats
  end

  def find_by_id(team_id)
    searched_team = @teams.find(team_id) do |team|
      team.id == team_id
    end
    searched_team
  end
end