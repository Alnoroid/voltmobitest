require 'rails_helper'

RSpec.describe Team, type: :model do
  it { is_expected.to have_many :players }

  before(:all) do
    @team1 = create(:team)
  end

  it 'is valid' do
    expect(@team1).to be_valid
  end

  it "is not valid without a name" do
    team2 = build(:team,name:nil)
    expect(team2).to_not be_valid
  end
end
