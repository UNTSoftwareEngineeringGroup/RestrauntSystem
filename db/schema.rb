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

ActiveRecord::Schema.define(version: 20151112184014) do

  create_table "compitems", force: :cascade do |t|
    t.string   "user"
    t.string   "reason"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code"
    t.date     "expiration"
    t.boolean  "usable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guestaccounts", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.date     "birthday"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.integer  "points"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.integer  "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_menuitems", id: false, force: :cascade do |t|
    t.integer "menuitem_id"
    t.integer "ingredient_id"
  end

  add_index "ingredients_menuitems", ["ingredient_id"], name: "index_ingredients_menuitems_on_ingredient_id"
  add_index "ingredients_menuitems", ["menuitem_id"], name: "index_ingredients_menuitems_on_menuitem_id"

  create_table "menuitems", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.text     "description"
    t.integer  "calories"
    t.string   "img"
    t.boolean  "available",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "price"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "item"
    t.string   "ingredients"
    t.string   "notes"
    t.integer  "istatus"
    t.integer  "ticket_id"
    t.integer  "compitem_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "order_items", ["compitem_id"], name: "index_order_items_on_compitem_id"
  add_index "order_items", ["ticket_id"], name: "index_order_items_on_ticket_id"

  create_table "tables", force: :cascade do |t|
    t.string   "password"
    t.string   "username"
    t.integer  "accesslevel"
    t.integer  "ticket"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "refills"
    t.boolean  "help"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "table"
    t.float    "total"
    t.float    "tax"
    t.integer  "tstatus"
    t.boolean  "togo",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "gratuity"
    t.float    "subtotal"
    t.boolean  "birthday"
    t.boolean  "coupon"
    t.boolean  "points"
  end

  create_table "totaltickets", force: :cascade do |t|
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "password"
    t.string   "username"
    t.integer  "accesslevel"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
