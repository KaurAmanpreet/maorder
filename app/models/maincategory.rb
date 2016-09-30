class Maincategory < ActiveRecord::Base
	has_one :category
	validates_presence_of :mainCategory
	validates_uniqueness_of :mainCategory
end
