require_relative 'spec_helper'
require './lib/game'

describe Game do 
  let(:game) {game = Game.new({ season:'20122013', away_goals: '2', home_goals: '3'})}
  describe "#initialize" do 
    it "has readable season" do

      expect(game.season).to eq("20122013")
    end

    it "has readable away_goals" do

      expect(game.away_goals).to eq(2)
    end

    it "has readable home_goals" do

      expect(game.home_goals).to eq(3)
    end
  end
end