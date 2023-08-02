require "./lib/game_teams.rb"

RSpec.describe GameTeam do
  before (:each) do
    @game_team1 = GameTeam.new({team_id: "3", result: 'LOSS', head_coach: "John Tortorella", shots: 8, goals: 2, tackles: 44})
  end

  it "can initialize" do 
    expect(@game_team1).to be_an_instance_of(GameTeam)
  end

  it "has readable attributes" do
    expect(@game_team1.team_id).to eq("3")
    expect(@game_team1.result).to eq("LOSS")
    expect(@game_team1.head_coach).to eq("John Tortorella")
    expect(@game_team1.shots).to eq(8)
    expect(@game_team1.goals).to eq(2)
    expect(@game_team1.tackles).to eq(44)
  end
end