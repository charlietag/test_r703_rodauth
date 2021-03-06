# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_15_031304) do
  create_table "account_authentication_audit_logs", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.datetime "at", default: -> { "current_timestamp(6)" }, null: false
    t.text "message", null: false
    t.text "metadata", size: :long, collation: "utf8mb4_bin"
    t.index ["account_id", "at"], name: "audit_account_at_idx"
    t.index ["account_id"], name: "index_account_authentication_audit_logs_on_account_id"
    t.index ["at"], name: "audit_at_idx"
    t.check_constraint "json_valid(`metadata`)", name: "metadata"
  end

  create_table "account_login_change_keys", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "login", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_password_reset_keys", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
    t.datetime "email_last_sent", default: -> { "current_timestamp(6)" }, null: false
  end

  create_table "account_remember_keys", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_verification_keys", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "requested_at", default: -> { "current_timestamp(6)" }, null: false
    t.datetime "email_last_sent", default: -> { "current_timestamp(6)" }, null: false
  end

  create_table "accounts", charset: "utf8mb4", force: :cascade do |t|
    t.integer "status", default: 1, null: false
    t.string "email", null: false
    t.string "password_hash"
    t.index ["email"], name: "index_accounts_on_email", unique: true
  end

  create_table "books", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "account_authentication_audit_logs", "accounts"
  add_foreign_key "account_login_change_keys", "accounts", column: "id"
  add_foreign_key "account_password_reset_keys", "accounts", column: "id"
  add_foreign_key "account_remember_keys", "accounts", column: "id"
  add_foreign_key "account_verification_keys", "accounts", column: "id"
end
