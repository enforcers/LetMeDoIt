ActiveAdmin.register Task do
  menu false
  index do
  	column :name do |task|
        link_to task.name, [:admin, task]
      end
  	column :project
    column :budget, :sortable => :budget do |task|
      div :class => "budget" do
        number_to_currency(task.budget, :unit => "&euro;", :format => "%n%u", :separator => ",", :delimiter => ".")
    end
end
  	column :created_at
  	column "Deadline", :due_date
  end
end
