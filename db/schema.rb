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

ActiveRecord::Schema.define(version: 20171202113854) do

  create_table "adjust_stock_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "adjust_stock_id"
    t.integer "item_id"
    t.string "serial_no", limit: 100
    t.float "qty", limit: 24
    t.integer "um_id"
    t.decimal "multiplier", precision: 18, scale: 6
    t.float "total_qty", limit: 24
    t.decimal "cost", precision: 18, scale: 6
    t.integer "adjust_type_id"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adjust_stock_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 100
    t.string "code", limit: 45
    t.text "remark"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adjust_stocks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.date "date"
    t.integer "location_id"
    t.string "auto_code", limit: 45
    t.string "ref_no", limit: 45
    t.text "remark"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "code", limit: 10
    t.string "name", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "audits", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index"
    t.index ["auditable_id", "auditable_type"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "company_profiles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "legal_name", limit: 100
    t.string "company_name", limit: 100
    t.string "tax_no", limit: 50
    t.string "mobile", limit: 50
    t.string "phone", limit: 200
    t.string "email", limit: 100
    t.string "website", limit: 200
    t.text "address"
    t.integer "update_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "account_no", limit: 200
    t.string "account_name", limit: 200
    t.string "bank_name", limit: 200
    t.string "vat_tin", limit: 20
  end

  create_table "contacts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "contact_name"
    t.string "contact_mobile"
    t.string "contact_id_card"
    t.string "contact_email"
    t.string "contact_address"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "symbol"
    t.string "abbr"
    t.decimal "fraction_unit", precision: 10
    t.decimal "rate_in", precision: 18, scale: 6
    t.decimal "rate_out", precision: 18, scale: 6
    t.boolean "is_base"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currency_tran_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "ref_type"
    t.integer "ref_id"
    t.integer "currency_id"
    t.decimal "sub_total", precision: 18, scale: 6
    t.decimal "dis_percentage", precision: 18, scale: 6
    t.decimal "dis_amount", precision: 18, scale: 6
    t.decimal "tax_amount", precision: 18, scale: 6
    t.decimal "grad_total", precision: 18, scale: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custom_price_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "custom_price_id"
    t.integer "item_id"
    t.integer "um_id"
    t.decimal "price", precision: 10
    t.decimal "extend_price", precision: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custom_prices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.boolean "is_active"
    t.string "description"
    t.integer "created_by"
    t.integer "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_balances", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "customer_id"
    t.date "date"
    t.decimal "balance", precision: 18, scale: 6
    t.integer "currency_id"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_transactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "transaction_id"
    t.integer "customer_id"
    t.date "date"
    t.integer "transaction_type_id"
    t.string "ref_no", limit: 45
    t.integer "currency_id"
    t.decimal "amount", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 45
    t.string "code", limit: 45
    t.text "remark"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "code", limit: 20
    t.string "name", limit: 100
    t.string "legal_name", limit: 100
    t.string "customer_type", limit: 20
    t.integer "customer_area_id"
    t.integer "custom_price_id"
    t.string "phone", limit: 100
    t.string "mobile", limit: 100
    t.string "email", limit: 100
    t.string "website", limit: 100
    t.string "address", limit: 500
    t.integer "contact_id"
    t.integer "lead_id"
    t.boolean "is_system_created"
    t.integer "create_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "vat_tin", limit: 20
  end

  create_table "departments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eods", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "date"
    t.string "password"
    t.text "memo"
    t.string "status"
    t.integer "create_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eoms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "encrypted_date"
    t.string "encrypted_last_close_date"
    t.string "encrypted_password", limit: 100
    t.text "memo"
    t.string "encrypted_status"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "invoice_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "invoice_id"
    t.integer "item_id"
    t.decimal "dis_amount", precision: 10
    t.decimal "dis_percentage", precision: 10
    t.integer "item_group_id"
    t.text "description"
    t.string "serial"
    t.float "qty", limit: 24
    t.integer "um_id"
    t.decimal "multiplier", precision: 18, scale: 6
    t.float "total_qty", limit: 24
    t.decimal "price", precision: 18, scale: 6
    t.decimal "extent_price", precision: 18, scale: 6
    t.integer "currency_id"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "invoice_no", limit: 45
    t.integer "sale_quotation_id"
    t.integer "location_id"
    t.integer "customer_id"
    t.date "date"
    t.date "due_date"
    t.string "ref_no", limit: 45
    t.decimal "total_amount", precision: 18, scale: 6
    t.decimal "discount_percentag", precision: 18, scale: 6
    t.decimal "discount_amount", precision: 18, scale: 6
    t.decimal "tax_percentag", precision: 18, scale: 6
    t.decimal "tax_amount", precision: 18, scale: 6
    t.decimal "grand_total_amount", precision: 18, scale: 6
    t.decimal "unpaid_amount", precision: 18, scale: 6
    t.decimal "paid_amount", precision: 18, scale: 6
    t.text "memo"
    t.integer "payment_flag", limit: 1
    t.string "status", limit: 1
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "is_sale_receipt"
  end

  create_table "issue_rental_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "item_id"
    t.text "description"
    t.string "serial", limit: 45
    t.float "qty", limit: 24
    t.integer "um_id"
    t.float "total_qty", limit: 24
    t.boolean "is_free"
    t.decimal "price", precision: 18, scale: 6
    t.decimal "total_amount", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issue_rentals", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "rental_no", limit: 45
    t.decimal "amount", precision: 18, scale: 6
    t.string "status", limit: 1
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_categories", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "sub_of_id"
    t.string "name", limit: 100
    t.string "remark", limit: 500
    t.boolean "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_group_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "item_id"
    t.decimal "qty", precision: 10
    t.integer "um_id"
    t.decimal "multiplier", precision: 10
    t.decimal "total_qty", precision: 10
    t.boolean "is_delete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_prices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "item_id"
    t.integer "um_id"
    t.decimal "multiplier", precision: 18, scale: 6
    t.decimal "price", precision: 18, scale: 6
    t.text "remark"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 20
    t.string "code", limit: 45
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 500
    t.string "code", limit: 50
    t.string "barcode", limit: 50
    t.integer "item_type_id"
    t.integer "category_id"
    t.integer "um_id"
    t.decimal "price", precision: 18, scale: 6
    t.integer "currency_id"
    t.decimal "cost_avc", precision: 18, scale: 6
    t.decimal "re_order_point", precision: 18, scale: 6
    t.boolean "is_use_serial"
    t.string "image_url", limit: 500
    t.integer "series_id"
    t.integer "model_id"
    t.string "color", limit: 50
    t.integer "depreciation_method_id"
    t.integer "depreciation_type_id"
    t.decimal "depreciation_rate", precision: 18, scale: 6
    t.text "memo"
    t.text "sale_description"
    t.text "purchase_description"
    t.boolean "status"
    t.integer "create_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lead_flag", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lead_opportunities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "code"
    t.string "oppunity_type"
    t.string "oppunity_to"
    t.integer "status_id"
    t.integer "customer_id"
    t.integer "lead_id"
    t.integer "contact_id"
    t.integer "source_id"
    t.integer "next_contact_by"
    t.datetime "next_contact_date"
    t.text "to_discuss"
    t.integer "created_by"
    t.integer "modified_by"
    t.boolean "is_with_item"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lead_opportunity_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "oppunity_id"
    t.integer "item_id"
    t.integer "um_id"
    t.float "qty", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "code"
    t.string "name", limit: 200
    t.string "legal_name", limit: 200
    t.string "industry", limit: 100
    t.integer "lead_area_id"
    t.integer "flag"
    t.string "phone", limit: 50
    t.string "email", limit: 200
    t.string "mobile", limit: 50
    t.string "website", limit: 200
    t.string "address", limit: 500
    t.integer "status"
    t.integer "source_id"
    t.integer "lead_owner"
    t.integer "next_contact_by"
    t.date "next_contact_date"
    t.string "lead_purpose", limit: 500
    t.integer "contact_id"
    t.integer "created_by"
    t.integer "modified_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 100
    t.string "phone", limit: 11
    t.string "fax", limit: 50
    t.string "website", limit: 50
    t.string "email", limit: 50
    t.string "address", limit: 500
    t.string "remark", limit: 500
    t.boolean "is_active"
    t.integer "create_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "look_ups", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "cod_type", limit: 30
    t.string "code", limit: 2
    t.string "name", limit: 50
    t.string "description", limit: 200
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenance_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "maintenance_id"
    t.integer "item_id"
    t.text "description"
    t.string "serial_no", limit: 45
    t.float "qty", limit: 24
    t.float "multiplier", limit: 24
    t.integer "um_id"
    t.float "total_qty", limit: 24
    t.boolean "is_free"
    t.decimal "price", precision: 18, scale: 6
    t.decimal "extend_price", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenances", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "maintenance_no", limit: 45
    t.integer "invoice_id"
    t.integer "customer_id"
    t.decimal "amount", precision: 18, scale: 6
    t.string "status", limit: 1
    t.date "start_date"
    t.date "end_date"
    t.text "remark"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 100
    t.string "code", limit: 45
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "next_versions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "n_type", limit: 100
    t.string "prefix", limit: 10
    t.string "next_code"
    t.integer "degit"
    t.boolean "is_manaul"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opening_stock_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "opening_stock_id"
    t.integer "item_id"
    t.string "serial_no", limit: 100
    t.float "qty", limit: 24
    t.integer "um_id"
    t.decimal "multiplier", precision: 18, scale: 6
    t.float "total_qty", limit: 24
    t.decimal "cost", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opening_stocks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "location_id"
    t.date "date"
    t.string "ref_no", limit: 100
    t.text "remark"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_terms", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "payment_term_name"
    t.text "payment_term_description"
    t.boolean "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_voucher_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "purchase_bill_id"
    t.decimal "amount", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_vouchers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "payment_voucher_no", limit: 45
    t.integer "vender_id"
    t.date "date"
    t.string "ref_no", limit: 45
    t.decimal "total_amount", precision: 18, scale: 6
    t.decimal "discount_percentag", precision: 18, scale: 6
    t.decimal "discount_amount", precision: 18, scale: 6
    t.decimal "grand_total_amount", precision: 18, scale: 6
    t.text "memo"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 100
    t.string "description"
    t.boolean "is_deleted"
    t.integer "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_bills", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "bill_no", limit: 45
    t.integer "purchase_order_id"
    t.date "date"
    t.date "due_date"
    t.string "ref_no", limit: 45
    t.decimal "total_amount", precision: 18, scale: 6
    t.decimal "discount_percentag", precision: 18, scale: 6
    t.decimal "discount_amount", precision: 18, scale: 6
    t.decimal "grand_total_amount", precision: 18, scale: 6
    t.text "memo"
    t.integer "payment_flag", limit: 1
    t.string "status", limit: 1
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_order_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "item_id"
    t.text "description"
    t.decimal "qty", precision: 18, scale: 6
    t.integer "um_id"
    t.decimal "total_qty", precision: 18, scale: 6
    t.decimal "cost", precision: 18, scale: 6
    t.decimal "extend_price", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "purchase_order_no", limit: 45
    t.date "date"
    t.date "expect_date"
    t.string "ref_no", limit: 45
    t.decimal "total_amount", precision: 18, scale: 6
    t.text "memo"
    t.string "status", limit: 3
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receive_payment_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "receive_payment_id"
    t.integer "invoice_id"
    t.decimal "amount", precision: 18, scale: 6
    t.integer "currency_id"
    t.text "description"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "last_balance", precision: 10
  end

  create_table "receive_payments", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "receipt_no", limit: 45
    t.integer "customer_id"
    t.date "date"
    t.string "payment_type", limit: 2
    t.string "check_no", limit: 10
    t.string "ref_no", limit: 45
    t.decimal "total_amount", precision: 18, scale: 6
    t.decimal "discount_percentag", precision: 18, scale: 6
    t.decimal "discount_amount", precision: 18, scale: 6
    t.decimal "grand_total_amount", precision: 18, scale: 6
    t.text "memo"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rel_menu_roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "menu_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.text "description"
    t.boolean "is_active"
    t.boolean "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_order_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "sale_order_id"
    t.integer "item_id"
    t.text "description"
    t.float "qty", limit: 24
    t.integer "um_id"
    t.decimal "total_qty", precision: 18, scale: 6
    t.decimal "price", precision: 18, scale: 6
    t.decimal "extent_price", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_orders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "sale_order_no", limit: 45
    t.date "date"
    t.date "expect_date"
    t.string "ref_no", limit: 100
    t.decimal "total_amount", precision: 18, scale: 6
    t.decimal "deposit_note", precision: 18, scale: 6
    t.text "memo"
    t.string "status", limit: 3
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_quotation_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "sale_quotation_id"
    t.integer "item_id"
    t.integer "item_group_id"
    t.text "description"
    t.float "qty", limit: 24
    t.integer "um_id"
    t.decimal "total_qty", precision: 18, scale: 6
    t.decimal "price", precision: 18, scale: 6
    t.decimal "extent_price", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_quotations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "sale_quotation_no", limit: 45
    t.string "quotation_to"
    t.integer "customer_id"
    t.integer "lead_id"
    t.date "date"
    t.date "expire_date"
    t.string "ref_no", limit: 100
    t.integer "payment_term_id"
    t.string "payment_term", limit: 500
    t.integer "sale_representative_id"
    t.text "note"
    t.decimal "total_amount", precision: 18, scale: 6
    t.decimal "tax_percentag", precision: 18, scale: 6
    t.decimal "tax_amount", precision: 18, scale: 6
    t.decimal "grand_total_amount", precision: 18, scale: 6
    t.text "memo"
    t.string "status", limit: 1
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_representatives", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "first_name", limit: 50
    t.string "last_name", limit: 50
    t.string "mobile", limit: 50
    t.string "phone", limit: 50
    t.string "email", limit: 50
    t.integer "position_id"
    t.text "address"
    t.text "remark"
    t.string "status", limit: 1
    t.date "register_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 100
    t.string "code", limit: 100
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "sources", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "description"
    t.integer "create_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_balances", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "item_id"
    t.date "date"
    t.decimal "balance", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_transactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "transaction_id"
    t.integer "transaction_type_id"
    t.string "ref_no", limit: 45
    t.date "date"
    t.integer "item_id"
    t.string "serial_no", limit: 45
    t.decimal "open_qty", precision: 10
    t.decimal "remain_qty", precision: 10
    t.float "qty", limit: 24
    t.integer "um_id"
    t.float "total_qty", limit: 24
    t.decimal "input_cost", precision: 18, scale: 6
    t.decimal "last_value", precision: 10
    t.decimal "total_value", precision: 18, scale: 6
    t.integer "location_id"
    t.integer "created_by"
    t.decimal "avg_cost", precision: 18, scale: 6
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_configs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "code"
    t.string "name"
    t.text "description"
    t.string "data_type"
    t.string "value"
    t.string "configs_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_menus", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "menu"
    t.string "icon_cls"
    t.boolean "expand"
    t.boolean "is_leaf"
    t.integer "parent_id"
    t.string "action"
    t.boolean "is_active"
    t.string "view_index"
    t.string "controller_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 45
    t.text "description"
    t.integer "flag", limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transfer_stock_details", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "transfer_stock_id"
    t.integer "item_id"
    t.float "qty", limit: 24
    t.integer "um_id"
    t.decimal "total_qty", precision: 18, scale: 6
    t.string "serial_no", limit: 100
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transfer_stocks", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "auto_code", limit: 45
    t.date "date"
    t.string "ref_no", limit: 100
    t.integer "from_location_id"
    t.integer "to_location_id"
    t.text "remark"
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ums", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "code", limit: 100
    t.string "name", limit: 100
    t.string "abbreviation", limit: 100
    t.string "remark", limit: 500
    t.integer "create_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "code"
    t.date "date_join"
    t.string "first_name"
    t.string "last_name"
    t.integer "role_id"
    t.integer "department_id"
    t.string "phone"
    t.string "email"
    t.string "username"
    t.string "encrypted_password"
    t.boolean "is_active"
    t.boolean "is_admin"
    t.text "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "api_key"
  end

  create_table "vender_balances", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "vernder_id"
    t.date "date"
    t.decimal "balance", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vender_transactions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "transaction_id"
    t.date "date"
    t.integer "transactioin_type_id"
    t.string "ref_no", limit: 45
    t.decimal "amount", precision: 18, scale: 6
    t.integer "created_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name", limit: 45
    t.string "legal_name", limit: 45
    t.string "phone", limit: 100
    t.string "mobile", limit: 100
    t.string "email", limit: 45
    t.string "website", limit: 45
    t.text "address"
    t.string "contact_name", limit: 50
    t.string "contact_mobile", limit: 45
    t.string "contact_id_card", limit: 45
    t.string "contact_email", limit: 45
    t.text "contact_address"
    t.integer "create_by"
    t.integer "modify_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
