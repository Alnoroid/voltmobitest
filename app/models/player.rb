class Player < ApplicationRecord
  belongs_to :team

  has_many :game_achievements
  has_many :achievements, :through => :game_achievements

  def award(game,achievement)
    GameAchievement.create!(player:self,game:game,achievement:achievement)
  end
end
