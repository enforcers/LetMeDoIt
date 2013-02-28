class Task < ActiveRecord::Base
  belongs_to :project
  has_many :bids

  after_save :create_notification

  alias_attribute :accepted, :bid_id

	validates :name,
		:presence => true
		
	validates :description,
		:presence => true

	validates :due_date,
		:presence => true

	validates :budget,
		:numericality => { :greater_than => 0 },
		:presence => true


	# validates :project_id,
	# 	:presence => true

	def create_notification
		unless self.bid_id.nil?
			accepted = Bid.find(self.bid_id)

			self.bids.each do |bid|
				if bid == accepted
					Mailer.bid_accepted(self).deliver
					Notification.fire(bid.user, bid, 2)
				else
					Mailer.bid_declined(self, bid).deliver
					Notification.fire(bid.user, bid, 3)
				end
			end
		end
	end

	def is_open?
		return self.accepted.nil? && self.due_date >= Date.today
	end

	def get_bid_for(user)
		return self.bids.where(:user_id => user).first
	end
end
