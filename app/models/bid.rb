class Bid < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  validates :user_id,
    :presence => true

  validate :bid_within_range

  validates :task_id,
    :presence => true

  validates :amount,
  	:numericality => true,
  	:presence => true

  validates :user_id, :uniqueness => { :scope => :task_id, :message => "only one bid per task" }

  def bid_within_range
    puts '#######################'
    puts amount ### = nil 
    puts task.budget

  	if amount <= 0 || amount > @task.budget
  		self.errors[:base] << "Please ensure that your bid is in range for the budget."
  	end
  end
end

