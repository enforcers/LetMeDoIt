ActiveAdmin.register Project do
  menu :priority => 3

  scope :all, :default => true
  scope :active
  scope :no_tasks

  index do
  	column :name do |project|
      link_to project.name, admin_project_path(project)
    end
    column :user
  	column :category
  	column :description, :sortable => false do |project|
      truncate(project.description)
    end
  	column :created_at
    default_actions
  end
  filter :name
  filter :user

  show do |project|
    attributes_table do
      row :name
      row :description
      row :user
      row :created_at
      row :tasks do
        link_to "Show", admin_project_tasks_path(project)
      end
    end
  end
end
