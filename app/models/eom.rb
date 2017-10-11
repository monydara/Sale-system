class Eom < ActiveRecord::Base
	attr_encrypted :password, :key => 'BnDsolution'
	attr_encrypted :date, :key => 'BnDsolution'
	attr_encrypted :last_close_date, :key => 'BnDsolution'
	attr_encrypted :status, :key => 'BnDsolution'
end
