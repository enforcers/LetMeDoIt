ActiveAdmin.register Task do
  belongs_to :project

  index do
  	column :name do |task|
      link_to task.name, admin_project_task_path(task.project, task)
    end
    column :project
    column :description, :sortable => false do |task|
      truncate(task.description)
    end
    column :budget do |task|
      number_to_currency(task.budget, :unit => "&euro;")
    end
  	column :due_date
    column :created_at
    default_actions
  end

  show do |task|
    attributes_table do
      row :name
      row :description
      row :budget
      row :created_at
      row :bids do
        link_to "Show", admin_task_bids_path(task)
      end
    end
  end

  filter :name
  filter :project
  filter :due_date
  filter :budget
end
