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

ActiveRecord::Schema.define(version: 20180531064139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.date     "buy_date"
    t.integer  "quantity"
    t.float    "net_price"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "product_category_id"
  end

  add_index "carts", ["product_category_id"], name: "index_carts_on_product_category_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "img"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "product_category_id"
  end

  add_index "images", ["product_category_id"], name: "index_images_on_product_category_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.date     "buy_date"
    t.float    "total_price"
    t.float    "delivery_charges"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "orders_product_categories", force: :cascade do |t|
    t.integer  "product_category_id"
    t.integer  "order_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "orders_product_categories", ["order_id"], name: "index_orders_product_categories_on_order_id", using: :btree
  add_index "orders_product_categories", ["product_category_id"], name: "index_orders_product_categories_on_product_category_id", using: :btree

  create_table "product_categories", force: :cascade do |t|
    t.integer  "quantity"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "price"
    t.string   "name"
    t.string   "description"
    t.integer  "product_id"
    t.json     "images"
    t.float    "GST"
  end

  add_index "product_categories", ["product_id"], name: "index_product_categories_on_product_id", using: :btree

  create_table "product_categories_orders", force: :cascade do |t|
    t.integer  "product_category_id"
    t.integer  "order_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "product_categories_orders", ["order_id"], name: "index_product_categories_orders_on_order_id", using: :btree
  add_index "product_categories_orders", ["product_category_id"], name: "index_product_categories_orders_on_product_category_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "product_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "mobile_number"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "carts", "product_categories"
  add_foreign_key "images", "product_categories"
  add_foreign_key "orders", "users"
  add_foreign_key "orders_product_categories", "orders"
  add_foreign_key "orders_product_categories", "product_categories"
  add_foreign_key "product_categories", "products"
  add_foreign_key "product_categories_orders", "orders"
  add_foreign_key "product_categories_orders", "product_categories"
end
