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

ActiveRecord::Schema.define(:version => 20120610002311) do

  create_table "people", :force => true do |t|
    t.string   "title"
    t.string   "first_name",                :null => false
    t.string   "last_name",                 :null => false
    t.string   "email",      :limit => 100, :null => false
    t.string   "work_phone", :limit => 50
    t.string   "mobile",     :limit => 50
    t.string   "job_title"
    t.string   "gender",     :limit => 1
    t.string   "string",     :limit => 1
    t.string   "keywords"
    t.text     "notes"
    t.integer  "address_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
