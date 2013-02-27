ActiveAdmin.register Bid do
  belongs_to :task

  index do
  	column :user
  	column :task
  	column :amount, :sortable => :amount do |bid|
      number_to_currency(bid.amount, :unit => "&euro;")
    end
  	column :comment, :sortable => false do |bid|
      truncate(bid.comment)
    end
    column :created_at
    default_actions
  end
end
