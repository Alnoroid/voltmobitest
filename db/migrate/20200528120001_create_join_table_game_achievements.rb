class CreateJoinTableGameAchievements < ActiveRecord::Migration[6.0]
  def change
    create_table :game_achievements do |t|
      t.references :game, null: false, foreign_key: true
      t.references :achievement, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true

      t.datetime :created_at
    end
  end
end
