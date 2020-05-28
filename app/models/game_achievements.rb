class GameAchievements < ApplicationRecord
  belongs_to :game
  belongs_to :achievement
  belongs_to :player
end