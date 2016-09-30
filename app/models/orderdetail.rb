class Orderdetail < ActiveRecord::Base
	has_many :ordermaster
	has_many :product
end
