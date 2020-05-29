FactoryBot.define do
  factory :team do
    name { "Superteam" }
    trait :no_name do
      name { nil }
    end
  end
end
