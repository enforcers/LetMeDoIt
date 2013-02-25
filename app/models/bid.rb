class Bid < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  scope :open, joins(:task).where(:tasks => { :bid_id => nil })
  scope :accepted, joins(:task).where(:tasks => { :bid_id => "bid.id" })
  scope :declined, joins(:task).where("tasks.bid_id IS NOT NULL AND tasks.bid_id != bids.id")

  validate :bid_within_range
  validates :amount,
  	:numericality => true,
  	:presence => true

  validates :user_id, :uniqueness => { :scope => :task_id, :message => "only one bid per task" }

  def bid_within_range
  	if amount <= 0 || amount > task.budget
  		self.errors[:base] << "Please ensure that your bid is in range for the budget."
  	end
  end
end
