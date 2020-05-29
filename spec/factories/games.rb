FactoryBot.define do
  factory :game do
    association :team1, factory: :team
    association :team2, factory: :team
  end
end
