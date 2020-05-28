FactoryBot.define do
  factory :game_achievement do
    association :game, factory: :game
    association :achievement, factory: :achievement
    association :player, factory: :player
  end
end