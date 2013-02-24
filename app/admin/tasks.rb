ActiveAdmin.register Task do
  index do
  	column :name
  	column :project
    column :budget, :sortable => :budget do |project|
      div :class => "budget" do
        number_to_currency project.budget
        default_actions
    end
end
  	column :created_at
  	column "Deadline", :due_date
  end
end
