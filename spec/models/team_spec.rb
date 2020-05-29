require 'rails_helper'

RSpec.describe Team, type: :model do
  it { is_expected.to have_many :players }

  it 'is valid' do
    expect(build(:team)).to be_valid
  end

  it 'is not valid without a name' do
    expect(build(:team,:no_name)).to_not be_valid
  end

  context 'methods' do
    let(:game) {create(:game)}
    let(:achievement) {create(:achievement)}

    describe '#top_5' do
      let!(:team1) {create(:team)}
      let!(:team2) {create(:team)}
      let(:top_players) {create_list(:player,5,team: team1)}
      let(:scrub_players) {create_list(:player,5,team: team1)}
      let(:scrub_players2) {create_list(:player,10,team: team2)}

      it 'is top 5 in team' do
        ids = []
        top_players.each do |p|
          ids.push(p.id)
          p.award(game,achievement)
        end
        expect(team1.top_5(achievement)).to eq(ids)
      end

      it 'is top 5 in team while another team have better players' do
        ids = []
        top_players.each do |p|
          ids.push(p.id)
          p.award(game,achievement)
        end
        scrub_players2.each do |p|
          2.times do
            p.award(game,achievement)
          end
        end
        expect(team1.top_5(achievement)).to eq(ids)
      end
    end

    describe '.top_5_all' do
      let(:top_players) {create_list(:player,5)}
      let(:scrub_players) {create_list(:player,5)}

      it 'is top 5 players' do
        ids = []
        top_players.each do |p|
          ids.push(p.id)
          p.award(game,achievement)
        end
        expect(Team.top_5_all(achievement)).to eq(ids)
      end
    end
  end


end
