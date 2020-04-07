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

ActiveRecord::Schema.define(version: 2020_04_07_025148) do

  create_table "boards", force: :cascade do |t|
    t.integer "owner_id"
    t.string "invite_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invite_code"], name: "index_boards_on_invite_code", unique: true
    t.index ["owner_id"], name: "index_boards_on_owner_id"
  end

  create_table "buying_prices", force: :cascade do |t|
    t.integer "user_id"
    t.integer "price"
    t.integer "amount"
    t.datetime "time_submitted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_buying_prices_on_user_id"
  end

  create_table "selling_prices", force: :cascade do |t|
    t.integer "user_id"
    t.integer "price"
    t.datetime "time_submitted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_selling_prices_on_user_id"
  end

  create_table "user_boards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "board_id"
    t.index ["board_id"], name: "index_user_boards_on_board_id"
    t.index ["user_id"], name: "index_user_boards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "display_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
