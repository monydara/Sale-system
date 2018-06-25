class Eom < ActiveRecord::Base
	attr_encrypted :password, :key =>  Rails.application.secrets.secret_key_base , algorithm: 'aes-256-cbc', mode: :single_iv_and_salt, insecure_mode: true
	attr_encrypted :date, :key =>  Rails.application.secrets.secret_key_base , algorithm: 'aes-256-cbc', mode: :single_iv_and_salt, insecure_mode: true
	attr_encrypted :last_close_date, :key =>  Rails.application.secrets.secret_key_base , algorithm: 'aes-256-cbc', mode: :single_iv_and_salt, insecure_mode: true
	attr_encrypted :status,:key =>  Rails.application.secrets.secret_key_base , algorithm: 'aes-256-cbc', mode: :single_iv_and_salt, insecure_mode: true
end
