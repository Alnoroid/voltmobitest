class Team < ApplicationRecord
  has_many :team1, class_name: "Game", foreign_key: "team1_id"
  has_many :team2, class_name: "Game", foreign_key: "team2_id"
  has_many :players

  validates :name, presence: true

  def top_5(achievement)
    GameAchievement
        .select('player_id,COUNT(*) as awards')
        .joins(:player)
        .where(achievement:achievement)
        .where('players.team_id':self)
        .group(:player_id).order(:awards => :desc)
        .limit(5).map(&:player_id)
  end

  def self.top_5_all(achievement)
    GameAchievement
        .select('player_id,COUNT(*) as awards')
        .where(achievement:achievement)
        .group(:player_id).order(:awards => :desc)
        .limit(5).map(&:player_id)
  end
end
