require_relative 'spec_helper'
require "./lib/team.rb"

RSpec.describe Team do
  before (:each) do
    @team1 = Team.new({name: "Astros", id: 3})
  end

  it "can initialize" do 
    expect(@team1).to be_an_instance_of(Team)
  end

  it "has readable attributes" do
    expect(@team1.name).to eq "Astros"
    expect(@team1.id).to eq 3
  end
end