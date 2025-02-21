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

ActiveRecord::Schema.define(:version => 20090307164715) do

  create_table "facilities", :force => true do |t|
    t.integer "site_id"
    t.integer "facility_type_id"
    t.boolean "public"
    t.integer "facility_sub_type_id"
  end

  create_table "facility_sub_types", :force => true do |t|
    t.string  "name"
    t.integer "facility_type_id"
  end

  create_table "facility_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "address"
    t.integer  "ward_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "postcode"
    t.decimal  "latitude",   :precision => 20, :scale => 17
    t.decimal  "longitude",  :precision => 20, :scale => 17
  end

end
