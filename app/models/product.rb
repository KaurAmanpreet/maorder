class Product < ActiveRecord::Base
	belongs_to :subcategory
	belongs_to :user
	has_many :ordermaster
	has_many :mobile
	has_many :photo
	has_many :tablet
	has_many :laptop
	has_many :camera
	has_many :menclothing
	has_many :womenclothing
	has_many :kidsclothing
	has_many :homefurnishing
	has_many :kitchenappliance
	has_many :furniture
	has_many :shoe
	validates :price, :presence =>true,
    				:numericality =>true
	validates_presence_of :productName,:productCode,:typee,:brand,:popularity
	validates_uniqueness_of :productName,:productCode
	before_save :downcase_fields
   def downcase_fields
      self.typee = self.typee.split(" ").join().downcase
   end
end