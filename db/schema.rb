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

ActiveRecord::Schema.define(:version => 20130609031211) do

  create_table "authors", :force => true do |t|
    t.string  "username",  :limit => 50,                  :null => false
    t.string  "password",  :limit => 50,                  :null => false
    t.integer "level",     :limit => 2,   :default => 0,  :null => false
    t.string  "name",      :limit => 200, :default => "", :null => false
    t.string  "location",  :limit => 200, :default => "", :null => false
    t.string  "email",     :limit => 100, :default => "", :null => false
    t.integer "subscribe", :limit => 2,   :default => 0,  :null => false
    t.date    "reg_date",                                 :null => false
    t.string  "ip",        :limit => 20,  :default => "", :null => false
  end

  create_table "definitions", :force => true do |t|
    t.integer "word_id",            :limit => 8,                   :null => false
    t.string  "tags",               :limit => 200, :default => "", :null => false
    t.text    "meaning",                                           :null => false
    t.date    "submit_date",                                       :null => false
    t.text    "example",                                           :null => false
    t.integer "image_id",                                          :null => false
    t.integer "up",                                :default => 0,  :null => false
    t.integer "down",                              :default => 0,  :null => false
    t.integer "under_review",       :limit => 2,   :default => 0,  :null => false
    t.integer "under_verification", :limit => 2,   :default => 0,  :null => false
    t.string  "verify_code",        :limit => 100, :default => "", :null => false
    t.integer "author_id",                         :default => 0,  :null => false
  end

  create_table "forum_question", :force => true do |t|
    t.string  "topic",                    :default => "", :null => false
    t.string  "detail",   :limit => 1000,                 :null => false
    t.string  "name",     :limit => 65,   :default => "", :null => false
    t.string  "email",    :limit => 65,   :default => "", :null => false
    t.string  "datetime", :limit => 25,   :default => "", :null => false
    t.integer "view",                     :default => 0,  :null => false
    t.integer "reply",                    :default => 0,  :null => false
  end

  create_table "images", :force => true do |t|
    t.string  "thumb",       :limit => 100,                :null => false
    t.string  "source",      :limit => 100,                :null => false
    t.string  "caption",     :limit => 500,                :null => false
    t.integer "need_review", :limit => 2,   :default => 0, :null => false
  end

  create_table "levels", :force => true do |t|
    t.integer "author_id",    :limit => 8, :null => false
    t.integer "system_level", :limit => 2, :null => false
    t.integer "active_level", :limit => 2, :null => false
    t.integer "score",        :limit => 8, :null => false
  end

  create_table "members", :force => true do |t|
    t.string  "name",     :limit => 100
    t.string  "username", :limit => 100, :default => "", :null => false
    t.string  "password", :limit => 32,  :default => "", :null => false
    t.integer "level",    :limit => 2,   :default => 0,  :null => false
    t.string  "location", :limit => 50,                  :null => false
    t.string  "email",    :limit => 100,                 :null => false
  end

  create_table "offences", :force => true do |t|
    t.string "offence", :limit => 100, :null => false
  end

  create_table "origins", :force => true do |t|
    t.string "origin", :limit => 100, :null => false
  end

  create_table "requests", :force => true do |t|
    t.string  "word",        :limit => 50,                :null => false
    t.date    "submit_date",                              :null => false
    t.integer "type",                                     :null => false
    t.integer "answered",    :limit => 2,  :default => 0, :null => false
    t.integer "author_id",   :limit => 8,                 :null => false
    t.string  "ip",          :limit => 50,                :null => false
  end

  create_table "tags", :force => true do |t|
    t.integer "word_id",   :limit => 8,                 :null => false
    t.integer "author_id", :limit => 8,                 :null => false
    t.string  "word",      :limit => 50,                :null => false
    t.date    "date",                                   :null => false
    t.integer "type",      :limit => 2,                 :null => false
    t.integer "answered",  :limit => 2,  :default => 0, :null => false
    t.string  "ip",        :limit => 50,                :null => false
  end

  create_table "word_examples", :force => true do |t|
    t.integer "word_id",   :limit => 8, :null => false
    t.text    "example",                :null => false
    t.integer "author_id", :limit => 8, :null => false
  end

  create_table "word_image", :force => true do |t|
    t.integer "word_id",  :limit => 8, :null => false
    t.integer "image_id", :limit => 8, :null => false
  end

  create_table "word_offence", :force => true do |t|
    t.integer "word_id",    :limit => 8, :null => false
    t.integer "offence_id", :limit => 2, :null => false
  end

  create_table "word_origin", :force => true do |t|
    t.integer "word_id",   :limit => 8, :null => false
    t.integer "origin_id", :limit => 2, :null => false
  end

  create_table "words", :force => true do |t|
    t.string  "word",        :limit => 500, :null => false
    t.integer "author_id",   :limit => 8,   :null => false
    t.date    "submit_date",                :null => false
    t.integer "views",       :limit => 8,   :null => false
  end

end
