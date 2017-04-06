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

ActiveRecord::Schema.define(version: 20170406073035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string   "cust_name"
    t.text     "cust_address"
    t.integer  "cust_postcode"
    t.string   "cust_state"
    t.string   "cust_phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "store_id"
    t.index ["store_id"], name: "index_customers_on_store_id", using: :btree
  end

  create_table "stores", force: :cascade do |t|
    t.string   "store_name"
    t.text     "store_address"
    t.integer  "store_postcode"
    t.string   "store_state"
    t.string   "store_phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_foreign_key "customers", "stores"
end
