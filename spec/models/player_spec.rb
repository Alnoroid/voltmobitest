require 'rails_helper'

RSpec.describe Player, type: :model do
  it { is_expected.to belong_to(:team) }

  it { is_expected.to have_many(:game_achievements) }
  it { is_expected.to have_many(:achievements) }

  it 'is valid' do
    expect(build(:player)).to be_valid
  end

  it 'is not valid without a name' do
    expect(build(:player,:no_name)).to_not be_valid
  end

  describe '#award' do
    let(:player) {build(:player)}
    let(:game) {build(:game)}
    let(:achievement) {build(:achievement)}
    it 'is awarded with achievement' do
      player.award(game,achievement)
      expect(player.achievements.length).to be 1
    end
  end
end