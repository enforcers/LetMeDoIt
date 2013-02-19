ActiveAdmin.register Project do
  index do
  	column :name
  	column :category_id
  	column :description
  	column "Created at", :created_at
  end

  filter :name
end
