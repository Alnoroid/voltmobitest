require 'rails_helper'



RSpec.describe Achievement, type: :model do
  it { is_expected.to have_many :game_achievements }
  it { is_expected.to have_many :players }

  before(:all) do
    @achievement1 = create(:achievement)
  end

  it 'is valid' do
    expect(@achievement1).to be_valid
  end

  it "is not valid without a name" do
    achievement2 = build(:achievement,name:nil)
    expect(achievement2).to_not be_valid
  end
end
