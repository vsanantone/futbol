class Game
  attr_reader :season, :away_goals, :home_goals, :game_id

  def initialize(game_data)
    @season = game_data[:season]
    @game_id = game_data[:game_id]
    @away_goals = game_data[:away_goals].to_i
    @home_goals = game_data[:home_goals].to_i
  end
end