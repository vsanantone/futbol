class Team
  attr_reader :name,
              :id

  def initialize(team_data)
    @name = team_data[:teamname]
    @id = team_data[:team_id]
  end
end