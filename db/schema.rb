# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_05_082753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_modes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_modes_summoner_spells", id: false, force: :cascade do |t|
    t.bigint "game_mode_id"
    t.bigint "summoner_spell_id"
    t.index ["game_mode_id"], name: "index_game_modes_summoner_spells_on_game_mode_id"
    t.index ["summoner_spell_id"], name: "index_game_modes_summoner_spells_on_summoner_spell_id"
  end

  create_table "last_updates", force: :cascade do |t|
    t.datetime "time"
  end

  create_table "runes", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.float "summoner_spell_cdr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "summoner_spells", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.integer "cooldown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "summoners", force: :cascade do |t|
    t.string "username"
    t.integer "summoner_id"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
