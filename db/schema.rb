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

ActiveRecord::Schema.define(version: 20160314) do

  create_table "past_price_records", primary_key: "past_price_record_id", force: :cascade do |t|
    t.integer  "product_id"
    t.decimal  "price"
    t.decimal  "percentage_change"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", primary_key: "product_id", force: :cascade do |t|
    t.integer  "external_product_id"
    t.decimal  "price"
    t.string   "product_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
