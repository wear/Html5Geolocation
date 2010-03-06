# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100306114850) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "filter"
    t.string   "city"  
    t.integer  "vendors_count"
    t.integer  "order" 
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer "count"
    t.string  "category"
    t.integer "vendor_id"
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "address"
    t.string   "phone"
    t.string   "work_time"
    t.string   "traffic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tags"
    t.integer  "sum"
    t.integer  "env"
    t.integer  "taste"
    t.integer  "avg"
    t.integer  "service"
    t.string   "category" 
    t.string   "city"  
    t.string   'area'
    t.float   'lat'
    t.float   'lng'
  end    
  
  create_table "bookings" do |t|
    t.integer  "vendor_id"
    t.datetime "date"
    t.integer  "time_range"
    t.integer  "guest_count"
    t.string   "requirment"
    t.integer  "bookable_id"
    t.string   "bookable_type"
    t.string   "contact"
    t.string   "email"
    t.string   "mobile"
    t.integer  "discount_id"
    t.integer  "discount_version"
    t.string   "status"
    t.timestamps
  end            
  
  create_table "users", :force => true do |t| 
    t.string "login"
    t.string "mobile"
    t.string "email",:limit => 100
    t.string "crypted_password", :limit => 40 
    t.string "salt", :limit => 40 
    t.string "remember_token", :limit => 40
    t.datetime "remember_token_expires_at"  
  end 
  
  add_index :users, :mobile, :unique => true

end
