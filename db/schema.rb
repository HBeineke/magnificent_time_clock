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

ActiveRecord::Schema.define(version: 20170315212455) do

  create_table "periods", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "parent_type"
    t.integer  "parent_id"
    t.integer  "period_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["parent_type", "parent_id"], name: "index_periods_on_parent_type_and_parent_id"
    t.index ["period_id"], name: "index_periods_on_period_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "report_id"
    t.string   "type"
    t.datetime "report_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["report_id"], name: "index_reports_on_report_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "taggables", force: :cascade do |t|
    t.string   "parent_type"
    t.integer  "parent_id"
    t.integer  "tag_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["parent_type", "parent_id"], name: "index_taggables_on_parent_type_and_parent_id"
    t.index ["tag_id"], name: "index_taggables_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
