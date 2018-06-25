class User < ActiveRecord::Base


  # cipher = OpenSSL::Cipher.new('aes-256-gcm')
  # cipher.encrypt # Required before '#random_key' or '#random_iv' can be called. http://ruby-doc.org/stdlib-2.0.0/libdoc/openssl/rdoc/OpenSSL/Cipher.html#method-i-encrypt
  # secret_key = cipher.random_key # Insures that the key is the correct length respective to the algorithm used.
  # iv = cipher.random_iv # Insures that the IV is the correct length respective to the algorithm used.
  # salt = SecureRandom.random_bytes(16)

  # Assign an API key on create
   before_create do |user|
      user.api_key = user.generate_api_key
   end

   # Generate a unique API key
   def generate_api_key
      loop do
         token = SecureRandom.base64.tr('+/=', 'Qrt')
         break token unless User.exists?(api_key: token)
      end
   end

   # attr_encrypted :password, :key =>  Rails.application.secrets.secret_key_base , algorithm: 'aes-256-cbc', mode: :single_iv_and_salt, insecure_mode: true
   belongs_to :role, foreign_key:"role_id"
   belongs_to :department , foreign_key: "department_id"
   validates_uniqueness_of :username
end
