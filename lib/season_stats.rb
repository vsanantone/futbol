# separate it out to make sure it is only ONE season and be able to compare total wins for each team/coach witin a season

class SeasonStats
  attr_reader :games, :teams, :game_teams
  def initialize(data)
    @games = build_games(data)
    @teams = build_teams(data)
    @game_teams = build_game_teams(data)  
  end

  def build_games(data)
    games = []
    info = CSV.parse (File.read(data[:games])), headers: true, header_converters: :symbol
    info.each do |row|
      games << Game.new(row)
    end
    games
  end

  def build_teams(data)
    teams = []
    team_info = CSV.parse (File.read(data[:teams])), headers: true, header_converters: :symbol
    team_info.each do |row|
      teams << Team.new(row)
    end
    teams
  end

  
  def build_game_teams(data)
    game_teams = []
    game_teams_info = CSV.parse (File.read(data[:game_teams])), headers: true, header_converters: :symbol
    game_teams_info.each do |row|
      game_teams << GameTeam.new(row)
    end
    game_teams
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