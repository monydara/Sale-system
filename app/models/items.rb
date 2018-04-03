class Items < ActiveRecord::Base
	belongs_to :item_category, foreign_key: 'category_id'
	belongs_to :item_type, foreign_key: 'item_type_id'
	belongs_to :ums , :foreign_key => "um_id"
	belongs_to :currency , :foreign_key => "currency_id"
	has_many :sale_quotation_detail , foreign_key:'item_id'
	has_many :opening_stock_detail, foreign_key: "item_id"
	has_many :adjust_stock_detail, foreign_key: "item_id"
	has_many :maintenance_detail, foreign_key: "item_id"
	has_many :invoice_detail, foreign_key: "item_id"
	has_many :transfer_stocks, foreign_key: "item_id"
	# --- relationship for item varaince
	has_many :item_sku, foreign_key: "item_id"
	has_many :item_sku_values , foreign_key: "item_id"
	has_many :item_options , foreign_key: "item_id"
	has_many :item_option_values , foreign_key: "item_id"
	has_many	:item_price

 validates_uniqueness_of :code

   # validates_presence_of :item_price

	# accepts_nested_attributes_for :item_price
	accepts_nested_attributes_for :item_sku , :allow_destroy => true
	accepts_nested_attributes_for :item_options ,:allow_destroy => true
=begin
	Function combo is use for get list combo  bind to
=end
	def self.combo query
		condition =""
		if query.nil? || query == ""

		else
			condition = "where itm.name like '%#{query}%' or isk.code like '%#{query}%' or itm.code like '%#{query}%'"
		end
			items = self.find_by_sql("select
				isk.id,
				itm.code,
				isk.price ,
				isk.code name,
				group_concat(  iop.option_name ,':', ipv.value_name )  'description',
				um.name 'um',
				um.id 'um_id',
				c.symbol,
				c.id 'currency_id'
				 from item_skus isk
				inner join items itm on itm.id = isk.item_id
				left join item_sku_values skv on skv.sku_id = isk.id
				left join item_options iop on iop.id = skv.option_id
				left join item_option_values ipv on ipv.id = skv.value_id
				left join ums um on um.id = itm.um_id
				left join currencies c on c.id = itm.currency_id
				#{condition}

				group by isk.id

			")
		items.each do |q|
			q.name = "#{q.name} #{q.description} "
		end

	end

	def self.save_item_sku_value id
	# def self.a id
		item = self.find id
		# -- update item_id to option value
		itemOption = item.item_options


		itemOption.each do |option|
			option.item_option_values.each do |value|
				value.update_attributes(item_id: id )
			end
		end
		# 1- loop item sku
		# 2- get option and value option
		# 3- add item base on record of option
		# === get item_option_value base on item
		itemValue = item.item_option_values
			item.item_sku.each do |i , value|

				codeSplited = i.code.split('/')
				codeSplited.each do |value|
						v = itemValue.find_by(value_name:value)
						if !v.nil?
							puts "===== id  = #{v.id}"
							# insert to  item_sku_value
							isv = ItemSkuValue.new({item_id: id , sku_id:i.id , option_id:v.option_id , value_id:v.id})
							isv.save
						end

				end


			end
	end
end
