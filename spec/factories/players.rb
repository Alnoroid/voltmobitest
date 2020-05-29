FactoryBot.define do
  factory :player do
    name { "Superman" }
    association :team, factory: :team

    trait :no_name do
      name { nil }
    end

    trait :topteam do
      association :team, factory: :team,name:'Topteam'
    end
  end
end
