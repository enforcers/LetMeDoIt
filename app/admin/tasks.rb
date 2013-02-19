ActiveAdmin.register Task do
  index do
    column :project 
    column :name do |task|
        link_to task.name, [:admin, task]
      end
    column :description
    column :budget
    column "Deadline", :due_date
  end
end
