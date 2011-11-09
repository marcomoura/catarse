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

ActiveRecord::Schema.define(:version => 20110930125532) do

  create_table "backers", :force => true do |t|
    t.integer  "project_id",                          :null => false
    t.integer  "user_id",                             :null => false
    t.integer  "reward_id"
    t.decimal  "value",                               :null => false
    t.boolean  "confirmed",        :default => false, :null => false
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "display_notice",   :default => false
    t.boolean  "anonymous",        :default => false
    t.text     "key"
    t.boolean  "can_refund",       :default => false
    t.boolean  "requested_refund", :default => false
    t.boolean  "refunded",         :default => false
    t.boolean  "credits",          :default => false
    t.boolean  "notified_finish",  :default => false
    t.integer  "site_id",          :default => 1,     :null => false
    t.text     "payment_method"
    t.text     "payment_token"
  end

  add_index "backers", ["confirmed"], :name => "index_backers_on_confirmed"
  add_index "backers", ["key"], :name => "index_backers_on_key"
  add_index "backers", ["project_id"], :name => "index_backers_on_project_id"
  add_index "backers", ["project_id"], :name => "index_confirmed_backers_on_project_id"
  add_index "backers", ["reward_id"], :name => "index_backers_on_reward_id"
  add_index "backers", ["user_id"], :name => "index_backers_on_user_id"

  create_table "categories", :force => true do |t|
    t.text     "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], :name => "categories_name_unique", :unique => true
  add_index "categories", ["name"], :name => "index_categories_on_name"

  create_table "comments", :force => true do |t|
    t.text     "title"
    t.text     "comment",                             :null => false
    t.text     "comment_html"
    t.integer  "commentable_id",                      :null => false
    t.string   "commentable_type",                    :null => false
    t.integer  "user_id",                             :null => false
    t.boolean  "project_update",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "configurations", :force => true do |t|
    t.text     "name",       :null => false
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curated_pages", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "analytics_id"
    t.string   "logo"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
    t.integer  "site_id"
  end

  add_index "curated_pages", ["permalink"], :name => "index_curated_pages_on_permalink"

  create_table "notifications", :force => true do |t|
    t.integer  "user_id",                          :null => false
    t.integer  "project_id"
    t.text     "text",                             :null => false
    t.text     "twitter_text"
    t.text     "facebook_text"
    t.text     "email_subject"
    t.text     "email_text"
    t.boolean  "dismissed",     :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id",       :default => 1,     :null => false
  end

  create_table "oauth_providers", :force => true do |t|
    t.text     "name",       :null => false
    t.text     "key",        :null => false
    t.text     "secret",     :null => false
    t.text     "scope"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "strategy"
    t.text     "path"
  end

  add_index "oauth_providers", ["name"], :name => "oauth_providers_name_unique", :unique => true

  create_table "payment_details", :force => true do |t|
    t.integer  "backer_id"
    t.string   "payer_name"
    t.string   "payer_email"
    t.string   "city"
    t.string   "uf"
    t.string   "payment_method"
    t.decimal  "net_amount"
    t.decimal  "total_amount"
    t.decimal  "service_tax_amount"
    t.decimal  "backer_amount_tax"
    t.string   "payment_status"
    t.string   "service_code"
    t.string   "institution_of_payment"
    t.datetime "payment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_logs", :force => true do |t|
    t.integer  "backer_id"
    t.integer  "status"
    t.float    "amount"
    t.integer  "payment_status"
    t.integer  "moip_id"
    t.integer  "payment_method"
    t.string   "payment_type"
    t.string   "consumer_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.text     "name",                           :null => false
    t.integer  "user_id",                        :null => false
    t.integer  "category_id",                    :null => false
    t.decimal  "goal",                           :null => false
    t.datetime "expires_at",                     :null => false
    t.text     "about",                          :null => false
    t.text     "headline",                       :null => false
    t.text     "video_url",                      :null => false
    t.text     "image_url"
    t.text     "short_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "can_finish",  :default => false
    t.boolean  "finished",    :default => false
    t.text     "about_html"
    t.integer  "site_id",     :default => 1,     :null => false
  end

  add_index "projects", ["category_id"], :name => "index_projects_on_category_id"
  add_index "projects", ["name"], :name => "index_projects_on_name"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "projects_curated_pages", :force => true do |t|
    t.integer  "project_id"
    t.integer  "curated_page_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects_managers", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  create_table "projects_sites", :force => true do |t|
    t.integer  "project_id",                     :null => false
    t.integer  "site_id",                        :null => false
    t.boolean  "visible",     :default => false, :null => false
    t.boolean  "rejected",    :default => false, :null => false
    t.boolean  "recommended", :default => false, :null => false
    t.boolean  "home_page",   :default => false, :null => false
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects_sites", ["project_id", "site_id"], :name => "projects_sites_project_id_site_id_unique", :unique => true

  create_table "rewards", :force => true do |t|
    t.integer  "project_id",      :null => false
    t.decimal  "minimum_value",   :null => false
    t.integer  "maximum_backers"
    t.text     "description",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rewards", ["project_id"], :name => "index_rewards_on_project_id"

  create_table "sites", :force => true do |t|
    t.text     "name",                            :null => false
    t.text     "title",                           :null => false
    t.text     "path",                            :null => false
    t.text     "host",                            :null => false
    t.text     "gender",                          :null => false
    t.text     "email",                           :null => false
    t.text     "twitter",                         :null => false
    t.text     "facebook",                        :null => false
    t.text     "blog",                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "auth_gateway", :default => false, :null => false
    t.text     "port"
  end

  add_index "sites", ["host"], :name => "sites_host_unique", :unique => true
  add_index "sites", ["name"], :name => "sites_name_unique", :unique => true
  add_index "sites", ["path"], :name => "sites_path_unique", :unique => true

  create_table "states", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "acronym",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["acronym"], :name => "states_acronym_unique", :unique => true
  add_index "states", ["name"], :name => "states_name_unique", :unique => true

  create_table "users", :force => true do |t|
    t.integer  "primary_user_id"
    t.text     "provider",                                 :null => false
    t.text     "uid",                                      :null => false
    t.text     "email"
    t.text     "name"
    t.text     "nickname"
    t.text     "bio"
    t.text     "image_url"
    t.boolean  "newsletter",            :default => false
    t.boolean  "project_updates",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                 :default => false
    t.text     "full_name"
    t.text     "address_street"
    t.text     "address_number"
    t.text     "address_complement"
    t.text     "address_neighbourhood"
    t.text     "address_city"
    t.text     "address_state"
    t.text     "address_zip_code"
    t.text     "phone_number"
    t.decimal  "credits",               :default => 0.0
    t.integer  "site_id",               :default => 1,     :null => false
    t.text     "session_id"
    t.text     "locale",                :default => "pt",  :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["name"], :name => "index_users_on_name"
  add_index "users", ["provider", "uid"], :name => "users_provider_uid_unique", :unique => true
  add_index "users", ["uid"], :name => "index_users_on_uid"

end
