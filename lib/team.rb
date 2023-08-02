class Team
  attr_reader :name,
              :id

  def initialize(team_data)
    @name = team_data[:name]
    @id = team_data[:id]
  end
end