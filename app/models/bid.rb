class Bid < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  scope :open, joins(:task).where(:tasks => { :bid_id => nil })
  scope :accepted, joins(:task).where(:tasks => { :bid_id => "bid.id" })
  scope :declined, joins(:task).where("tasks.bid_id IS NOT NULL AND tasks.bid_id != bids.id")

  validate :bid_within_range

  validates :task_id,
    :presence => true

  validates :amount,
  	:numericality => true,
  	:presence => true

  validates :user_id, :uniqueness => { :scope => :task_id, :message => "only one bid per task" },
    :presence => true

  def bid_within_range
    return false if (amount.nil? || task.nil?)
  	if amount <= 0 || amount > task.budget
  		self.errors[:base] << "Please ensure that your bid is in range for the budget."
  	end
  end

  def self.for_user(user)
    return where(:user_id => user)
  end
end

