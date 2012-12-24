class Category < ActiveRecord::Base
	default_scope order('id ASC')

	has_many :child_categories,
		:class_name => "Category",
		:foreign_key => "category_id",
		:order => "category_id",
		:dependent => :destroy
	belongs_to :parent_category, :class_name => "Category", :foreign_key => "category_id"

	validates :name,
		:presence => true
end