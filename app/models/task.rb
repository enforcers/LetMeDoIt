class Task < ActiveRecord::Base
  belongs_to :project
  has_many :bids

  alias_attribute :accepted, :bid_id

	validates :name,
		:presence => true
		
	validates :description,
		:presence => true

	validates :due_date,
		:presence => true

	validates :budget,
		:numericality => true,
		:presence => true


	# validates :project_id,
	# 	:presence => true

	def is_open?
		return self.accepted.nil? && self.due_date >= Date.today
	end

	def get_bid_for(user)
		return self.bids.where(:user_id => user).first
	end
end
