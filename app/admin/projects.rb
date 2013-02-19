ActiveAdmin.register Project do
scope :no_tasks

  index do
  	column :name do |project|
        link_to project.name, [:admin, project]
      end
  	column :category_id
  	column :description
  	column "Created at", :created_at
  end

  filter :name
end
