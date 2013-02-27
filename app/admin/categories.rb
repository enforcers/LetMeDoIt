ActiveAdmin.register Category do
  menu :priority => 2

  scope :parents_only, :default => true
  filter false

  index do
    column :name
    column :sub_categories do |category|
    	category.child_categories.each do |child|
    		div link_to child.name, admin_category_path(child)
    	end
    end
    default_actions

#      h2 category.name
#      table_for category.child_categories do
#        column :sub_categories do |child|
#          link_to child.name, admin_category_path(child)
#        end
#        column do |child|
#          link_to "Delete", admin_category_path(child), :method => :delete
#        end
#      end
#    end
#    default_actions
  end

  show do
    attributes_table do
      row :name
      row :parent_category
    end
  end

  form do |f|
  	f.inputs "User Details" do
  		f.input :parent_category, :collection => Category.parents_only
  		f.input :name
  	end
  	f.buttons
  end
end