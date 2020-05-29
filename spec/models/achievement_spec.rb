require 'rails_helper'

RSpec.describe Achievement, type: :model do
  it { is_expected.to have_many :game_achievements }
  it { is_expected.to have_many :players }

  it 'is valid' do
    expect(build(:achievement)).to be_valid
  end

  it 'is not valid without a name' do
    expect(build(:achievement,:no_name)).to_not be_valid
  end

  describe '#last_5' do
    let(:top_player) {build(:player,name: 'top',)}
    let(:scrub_player) {build(:player,name: 'scrub')}
    let(:games_played) {create_list(:game,6)}
    let(:achievement) {build(:achievement)}

    it 'is top ranking player by achievement in last 5 games' do
      top_player.award(games_played.last,achievement)
      scrub_player.award(games_played.first,achievement)
      expect(achievement.last_5(top_player)).to be true
    end

    it 'is not top ranking player because another one does' do
      top_player.award(games_played.first,achievement)
      scrub_player.award(games_played.last,achievement)
      expect(achievement.last_5(top_player)).to be false
    end

    it 'is not top ranking player because 5 games have passed' do
      top_player.award(games_played.first,achievement)
      expect(achievement.last_5(top_player)).to be false
    end
  end
end
