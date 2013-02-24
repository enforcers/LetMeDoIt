ActiveAdmin.register Project do
scope :no_tasks


  index do
  	column :name do |project|
        link_to project.name, [:admin, project]
      end
  	column :category
  	column :description
  	column "Created at", :created_at
    default_actions
  end
  filter :name

show do
  attributes_table do
   row :name
   row :description
   row :user
   row :created_at
  end

  panel "Tasks" do
   table_for project.tasks do
    column :name
    column :description
    column  "Deadline", :due_date
    column :budget, :sortable => :budget do |project|
      div :class => "budget" do
        number_to_currency project.budget
      end
    end
   end
  end
 end
end