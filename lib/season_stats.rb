# separate it out to make sure it is only ONE season and be able to compare total wins for each team/coach witin a season

class SeasonStats
  attr_reader :games, :teams, :game_teams
  def initialize(data)
    @games = build_games(data)
    @teams = build_teams(data)
    @game_teams = build_game_teams(data)  
  end

  def indiv_season(season_id)
    season = games.find_all do |game|
      season_id == game.season 
    end
    game_season = []
    game_teams.find_all do |game_team|
      season.find_all do |season_game|
        if game_team.game_id == season_game.game_id
          game_season << game_team
        end
      end
    end
    game_season
  end

  def win_or_loss_per_season(season_id, expected_result)
    season = indiv_season(season_id) 
    season_games = season.find_all do |game|
      game.result == expected_result
    end
    season_games
  end

  def total_games_by_coach(season_id, coach)
    season = indiv_season(season_id)
    coach_games = season.find_all do |game|
      game.head_coach == coach
    end
    coach_games.length
  end

  def winningest_coach(season_id)
    season = win_or_loss_per_season(season_id, "WIN")
    most_wins = season.map do |game|
      game.head_coach
    end
    most_wins_hash = most_wins.tally do |coach, total_wins|
      coach
    end
    coach_win_percentages = most_wins_hash.max_by do |coach, total_wins|
      total_games = total_games_by_coach(season_id, coach).to_f
      total_wins.to_f / total_games
    end
    coach_win_percentages[0]
  end

  def most_tackles(season_id)
    season = indiv_season(season_id)
    most_tackles = season.max_by do |game|
      game.tackles
      require 'pry'; binding.pry
    end
  end

  # def worst_coach(season_id)
  #   season = win_or_loss_per_season(season_id, "WIN")
  #   most_wins = season.map do |game|
  #     game.head_coach
  #   end
  #   most_wins_hash = most_wins.tally do |coach, total_wins|
  #     coach
  #   end
  #   coach_win_percentages = most_wins_hash.min_by do |coach, total_wins|
  #     total_games = total_games_by_coach(season_id, coach).to_f
  #     total_wins.to_f / total_games
  #   end
  #   require 'pry';binding.pry
  #   coach_win_percentages[0]
  # end
    
end


