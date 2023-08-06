require_relative 'spec_helper'
require "./lib/team"

RSpec.describe Team do
  let(:team_data) do
    {
      teamname: "Atlanta United",
      team_id: "1",
      franchiseid: "23",
      abbreviation: "ATL",
      Stadium: "Mercedes-Benz Stadium",
      link: "/api/v1/teams/1"
    }
  end

  let(:team) { Team.new(team_data) }

  it "can initialize" do
    expect(team).to be_an_instance_of(Team)
  end

  it "has readable attributes" do
    expect(team.name).to eq "Atlanta United"
    expect(team.id).to eq "1"
    expect(team.franchise_id).to eq "23"
    expect(team.abbreviation).to eq "ATL"
    expect(team.stadium).to eq "Mercedes-Benz Stadium"
    expect(team.link).to eq "/api/v1/teams/1"
  end
end