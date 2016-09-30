class Subcategory < ActiveRecord::Base
	has_one :product
	belongs_to :category
	validates_presence_of :category_id
	validates_presence_of :subCategory
	
end
