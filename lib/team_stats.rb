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
      @teams << Team.new(id: row[:team_id], name: row[:teamName].to_s)
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
    team_stats[:team_name] = team[:name]

    relevant_game_teams = @game_teams_data.select do |game_team| 
      game_team[:team_id] == team_id.to_s
    end

    relevant_game_teams.each do |game_team|
      if game_team[:result] == 'WIN'
        team_stats[:wins] += 1
      elsif game_team[:result] == 'LOSS'
        team_stats[:losses] += 1
      end
      team_stats[:shots_on_goal] += game_team[:shots].to_i
      team_stats[:total_goals] += game_team[:goals].to_i
    end
    team_stats
  end

  # iterate through my teams array

  def find_by_id(team_id)
    # require 'pry';binding.pry
    searched_team = @teams.find(team_id) do |team|
      team.id == team_id
    end
    searched_team
  end
  #   team_data = @teams_data.find do |team|
  #     team[:team_id] == team_id
  #   end
  #   Team.new(team_id: team_data[:team_id], name: team_data[:teamName])
  # end
end