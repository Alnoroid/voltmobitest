FactoryBot.define do
  factory :game do
    association :team1, factory: :game
    association :team2, factory: :game
  end
end
