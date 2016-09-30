class Ordermaster < ActiveRecord::Base
	belongs_to :orderdetail
	has_one :user
	belongs_to :product
end
