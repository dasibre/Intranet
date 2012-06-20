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

ActiveRecord::Schema.define(:version => 20120620161516) do

  create_table "addresses", :force => true do |t|
    t.string   "street_1",                :null => false
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip",        :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_companies", :force => true do |t|
    t.integer "categories_id"
    t.integer "companies_id"
  end

  create_table "catetories", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name",                     :null => false
    t.string   "phone",      :limit => 50
    t.string   "fax",        :limit => 50
    t.string   "website"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "title"
    t.string   "first_name",                   :null => false
    t.string   "last_name",                    :null => false
    t.string   "email",         :limit => 100, :null => false
    t.string   "work_phone",    :limit => 50
    t.string   "mobile",        :limit => 50
    t.string   "job_title"
    t.string   "gender",        :limit => 1
    t.string   "string",        :limit => 1
    t.string   "keywords"
    t.text     "notes"
    t.integer  "address_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_birth"
  end

end
