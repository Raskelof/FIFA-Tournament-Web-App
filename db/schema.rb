# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120127102209) do

  create_table "match_logs", :force => true do |t|
    t.integer  "match_id"
    t.text     "msg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", :force => true do |t|
    t.integer  "home_score"
    t.integer  "away_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.text     "points_trace"
  end

  create_table "player_logs", :force => true do |t|
    t.integer  "player_id"
    t.text     "msg"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "standing"
  end

  create_table "players", :force => true do |t|
    t.string   "username"
    t.integer  "score"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players_teams", :id => false, :force => true do |t|
    t.integer "team_id"
    t.integer "player_id"
  end

  create_table "teams", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
