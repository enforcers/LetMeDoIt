ActiveAdmin::Dashboards.build do
  section "Recent Projects" do
    table_for Project.order("created_at desc").limit(5) do
      column :name do |project|
        link_to project.name, [:admin, project]
      end
      column :created_at
    end
    strong { link_to "View All Projects", admin_projects_path }
  end

  section "Recent Tasks" do
  	table_for Task.order("created_at desc").limit(5) do
  		column :name do |task|
  			link_to task.name, [:admin, task]
  		end
  		column :project
  		column :created_at
  	end
  end

  section "Recent Bids" do
  	table_for Bid.order("created_at desc").limit(5) do
  		column :user 
  		column :task
  		column :created_at
  		    column :amount, :sortable => :amount do |bid|
      div :class => "amount" do
        number_to_currency(bid.amount, :unit => "&euro;", :format => "%n%u", :separator => ",", :delimiter => ".")
    end
    end
  	end
  end
end
