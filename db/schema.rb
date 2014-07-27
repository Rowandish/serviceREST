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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140727204011) do

  create_table "buildings", force: true do |t|
    t.integer  "user_id"
    t.integer  "static_building_id"
    t.integer  "level"
    t.datetime "time_creation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "map_index"
    t.datetime "finished_at"
  end

  create_table "static_buildings", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "rank"
    t.integer  "speed"
    t.integer  "max_level"
    t.integer  "monster_max"
    t.integer  "max_monsters"
    t.integer  "price"
  end

  create_table "static_monsters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "rank"
    t.integer  "max_level"
    t.integer  "price"
    t.integer  "base_power"
    t.integer  "base_agility"
    t.integer  "base_mind"
    t.integer  "base_charisma"
    t.integer  "base_joy"
  end

  create_table "user_infos", force: true do |t|
    t.integer  "user_id"
    t.integer  "money"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "max_buildings"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
    t.string   "username"
    t.integer  "level"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
