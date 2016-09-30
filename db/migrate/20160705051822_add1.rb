class Add1 < ActiveRecord::Migration
  def change
  	add_column :menclothings,"popularity",:string,:limit=>10
  	add_column :womenclothings,"popularity",:string,:limit=>10
  	add_column :kidsclothings,"popularity",:string,:limit=>10
  	add_column :womenbags,"popularity",:string,:limit=>10
  	add_column :cameras,"popularity",:string,:limit=>10
  end
end
