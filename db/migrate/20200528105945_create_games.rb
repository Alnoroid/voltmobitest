class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.references :team1, null: false, foreign_key: { to_table: 'teams' }
      t.references :team2, null: false, foreign_key: { to_table: 'teams' }

      t.datetime :created_at
    end
  end
end
