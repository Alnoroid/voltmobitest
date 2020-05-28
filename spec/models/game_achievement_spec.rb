require 'rails_helper'

RSpec.describe GameAchievement, type: :model do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to belong_to(:player) }
  it { is_expected.to belong_to(:achievement) }
end
