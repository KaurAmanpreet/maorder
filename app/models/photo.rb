class Photo < ActiveRecord::Base
	belongs_to :product
	validates_uniqueness_of :product_id
	validates_presence_of :product_id
end
