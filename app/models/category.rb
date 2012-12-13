class Category < ActiveRecord::Base
	has_many :child_categories,
		:class_name => "Category",
		:foreign_key => "category_id",
		:order => "category_id",
		:dependent => :destroy
	belongs_to :parent_category, :class_name => "Category", :foreign_key => "category_id"
  	
	validates :name,
		:presence => true

  	def to_param
  		"#{id}-#{name.parameterize}"
  	end
end