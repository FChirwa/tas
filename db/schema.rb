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

ActiveRecord::Schema.define(:version => 20130120143349) do

  create_table "assets", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billing_rates", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_messages", :force => true do |t|
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.string   "message"
  end

  create_table "customer_services", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_types", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
  end

  create_table "message_types", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_identifier_types", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_identifiers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person_names", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "titles", :force => true do |t|
    t.integer  "customer_message_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
