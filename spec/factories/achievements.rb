FactoryBot.define do
  factory :achievement do
    name { "Medal of honor" }
    trait :no_name do
      name { nil }
    end
  end
end
