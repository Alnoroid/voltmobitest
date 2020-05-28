require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to belong_to(:team1) }
  it { is_expected.to belong_to(:team2) }

end
