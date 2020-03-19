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

ActiveRecord::Schema.define(version: 2020_03_19_155250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "year_signed"
    t.string "signed_using"
    t.boolean "trade_clause"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "position"
    t.bigint "team_id", null: false
    t.string "salary"
    t.string "final_year_of_contract"
    t.string "player_image"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "swaps", force: :cascade do |t|
    t.bigint "trade_id", null: false
    t.bigint "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "team_id", null: false
    t.index ["player_id"], name: "index_swaps_on_player_id"
    t.index ["team_id"], name: "index_swaps_on_team_id"
    t.index ["trade_id"], name: "index_swaps_on_trade_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "cap_space"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "logo"
    t.string "cap_spent"
  end

  create_table "trades", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trades_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "team"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "votes", force: :cascade do |t|
    t.string "category"
    t.bigint "user_id", null: false
    t.bigint "trade_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trade_id"], name: "index_votes_on_trade_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "players", "teams", on_delete: :cascade
  add_foreign_key "swaps", "players", on_delete: :cascade
  add_foreign_key "swaps", "teams", on_delete: :cascade
  add_foreign_key "swaps", "trades", on_delete: :cascade
  add_foreign_key "trades", "users", on_delete: :cascade
  add_foreign_key "votes", "trades", on_delete: :cascade
  add_foreign_key "votes", "users"
end
