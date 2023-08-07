class GameTeam
  attr_reader :game_id, :team_id, :result, :head_coach, :shots, :goals, :tackles, :hoa

  def initialize(game_team_data)
    @game_id = game_team_data[:game_id]
    @team_id = game_team_data[:team_id]
    @result = game_team_data[:result]
    @head_coach = game_team_data[:head_coach]
    @shots = game_team_data[:shots]
    @goals = game_team_data[:goals]
    @tackles = game_team_data[:tackles]
    @hoa = game_team_data[:hoa]
  end
end