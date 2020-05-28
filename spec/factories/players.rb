FactoryBot.define do
  factory :player do
    name { "SuperTeam" }
    association :team, factory: :team
  end
end
