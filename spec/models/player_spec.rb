require 'rails_helper'

RSpec.describe Player, type: :model do
  it { is_expected.to belong_to(:team) }

  it { is_expected.to have_many(:game_achievements) }
  it { is_expected.to have_many(:achievements) }

  before(:all) do
    @player1 = create(:player)
  end

  it 'is valid' do
    expect(@player1).to be_valid
  end

  it "is not valid without a name" do
    player2 = build(:player,name:nil)
    expect(player2).to_not be_valid
  end
end
