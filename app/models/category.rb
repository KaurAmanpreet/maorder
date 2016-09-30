class Category < ActiveRecord::Base
	belongs_to :maincategory
	has_one :subcategory
	validates_presence_of :maincategory_id
	validates_presence_of :category,:message =>" name can't be blank"
	validates_uniqueness_of :category,:message =>" name already exist..Please enter another one!!"
end
