ActiveAdmin.register Task do
  index do
    column "Project", :project_id do |project|
        link_to project.id, [:admin, project]
      end
    column :name
    column :description
    column :budget
    column "Deadline", :due_date
  end
end
