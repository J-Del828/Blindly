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

ActiveRecord::Schema.define(version: 2021_11_23_132339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.boolean "want_match", default: false
    t.bigint "requester_id"
    t.bigint "partner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partner_id"], name: "index_matches_on_partner_id"
    t.index ["requester_id"], name: "index_matches_on_requester_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "match_id"
    t.bigint "relationship_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id"], name: "index_messages_on_match_id"
    t.index ["relationship_id"], name: "index_messages_on_relationship_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "partner_1_id"
    t.bigint "partner_2_id"
    t.integer "affinity", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partner_1_id"], name: "index_relationships_on_partner_1_id"
    t.index ["partner_2_id"], name: "index_relationships_on_partner_2_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.integer "age"
    t.text "biography"
    t.string "gender"
    t.string "preferred_gender"
    t.integer "preferred_age"
    t.jsonb "interests"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "matches", "users", column: "partner_id"
  add_foreign_key "matches", "users", column: "requester_id"
  add_foreign_key "messages", "matches"
  add_foreign_key "messages", "relationships"
  add_foreign_key "relationships", "users", column: "partner_1_id"
  add_foreign_key "relationships", "users", column: "partner_2_id"
end
