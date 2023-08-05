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
    season
  end

  def all_winning_games
    winning_games = game_teams.find_all do |game|
      game.result == "WIN"
    end
    winning_games
  end

  def all_losing_games
    losing_games = game_teams.find_all do |game|
      game.result == "LOSS"
    end
    losing_games
  end
end