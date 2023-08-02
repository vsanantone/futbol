class GameTeam
  attr_reader :team_id, :result, :head_coach, :shots, :goals, :tackles

  def initialize(game_team_data)
    @team_id = game_team_data[:team_id]
    @result = game_team_data[:result]
    @head_coach = game_team_data[:head_coach]
    @shots = game_team_data[:shots]
    @goals = game_team_data[:goals]
    @tackles = game_team_data[:tackles]
  end
end