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

ActiveRecord::Schema.define(:version => 20120527105027) do

  create_table "houses", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ls_attendances", :force => true do |t|
    t.string   "ls_parliament_member_id"
    t.boolean  "status"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "ls_session_date_id"
  end

  create_table "ls_parliament_members", :force => true do |t|
    t.integer  "ls_parliament_id"
    t.integer  "division_id"
    t.string   "state"
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "ls_parliaments", :force => true do |t|
    t.integer  "house_id"
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ls_session_dates", :force => true do |t|
    t.integer  "ls_session_id"
    t.datetime "date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "ls_sessions", :force => true do |t|
    t.integer  "ls_parliament_id"
    t.integer  "session_number"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
