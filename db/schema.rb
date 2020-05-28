# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_28_120001) do

  create_table "achievements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "game_achievements", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "achievement_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at"
    t.index ["achievement_id"], name: "index_game_achievements_on_achievement_id"
    t.index ["game_id"], name: "index_game_achievements_on_game_id"
    t.index ["player_id"], name: "index_game_achievements_on_player_id"
  end

  create_table "games", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "team1_id", null: false
    t.bigint "team2_id", null: false
    t.datetime "created_at"
    t.index ["team1_id"], name: "index_games_on_team1_id"
    t.index ["team2_id"], name: "index_games_on_team2_id"
  end

  create_table "players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "game_achievements", "achievements"
  add_foreign_key "game_achievements", "games"
  add_foreign_key "game_achievements", "players"
  add_foreign_key "games", "teams", column: "team1_id"
  add_foreign_key "games", "teams", column: "team2_id"
  add_foreign_key "players", "teams"
end
