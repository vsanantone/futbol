class Team
  attr_reader :name,
              :id,
              :franchise_id,
              :abbreviation,
              :stadium,
              :link

  def initialize(team_data)
    @name = team_data[:teamname]
    @id = team_data[:team_id]
    @franchise_id = team_data[:franchiseid]
    @abbreviation = team_data[:abbreviation]
    @stadium = team_data[:Stadium]
    @link = team_data[:link]
  end
end