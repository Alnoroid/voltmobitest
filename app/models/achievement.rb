class Achievement < ApplicationRecord
  has_many :game_achievements
  has_many :players, :through => :game_achievements

  def last_5(player)
    last_games_count = GameAchievement.joins('JOIN (SELECT games.* FROM games
    ORDER BY games.id DESC
    LIMIT 5) last_games ON last_games.id = game_achievements.game_id')
         .where(player: player)
         .where(achievement: self)
         .length
    last_games_count != 0
  end
end
