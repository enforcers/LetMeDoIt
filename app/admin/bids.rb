ActiveAdmin.register Bid do
  menu false
  index do
  	column :user
  	column :task
  	column :amount, :sortable => :amount do |bid|
      div :class => "amount" do
        number_to_currency(bid.amount, :unit => "&euro;", :format => "%n%u", :separator => ",", :delimiter => ".")
    end
    end
  	column :comment
  end
end
