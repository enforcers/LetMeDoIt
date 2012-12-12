class Category < ActiveRecord::Base
	has_many :child_categories, :class_name => "Category", :foreign_key => "category_id"
	belongs_to :parent_category, :class_name => "Category", :foreign_key => "category_id"
  	#belongs_to :category, :class_name => "Category"

  	def to_param
  		"#{id}-#{name.parameterize}"
  	end
end
