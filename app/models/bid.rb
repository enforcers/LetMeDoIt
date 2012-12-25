class Bid < ActiveRecord::Base
  belongs_to :task
  belongs_to :user

  validate :bid_within_range
  validates :amount,
  	:numericality => true,
  	:presence => true

  def bid_within_range
  	if amount <= 0 || amount > task.budget
  		self.errors[:base] << "Please ensure that your bid is in range for the budget."
  	end
  end
end
