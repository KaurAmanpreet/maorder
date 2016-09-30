class User < ActiveRecord::Base
	require 'digest/sha1'
	before_save :do_hashing
	has_one :userdetail
	require 'digest/sha1'
	before_save :do_hashing
	has_many :product
	paginates_per 5

	validates_presence_of :email,:password
	validates_uniqueness_of :email
	VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
	 validates_length_of :password, minimum: 6 

	 	def hash_password(password)
	 		return Digest::SHA1.hexdigest(password)
	 	end

	 	def do_hashing
	 		self.password = hash_password(self.password)
	 	end

	 def self.authenticate_user(email,password)
    	@user = User.find_by_email(email)
		if @user && @user.password ==  self.new.hash_password(password)
			return @user
		else
			return false
	  	end 
    end
end
