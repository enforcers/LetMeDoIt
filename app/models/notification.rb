class Notification < ActiveRecord::Base
	default_scope order('created_at DESC')
	belongs_to :user
	belongs_to :bid

	# ntype -> Type of Event
	#  1	New bid for task
	#  2	Bid accepted
	#  3	Bid declined

	def self.pull(user)
		return self.where(:user_id => user.id, :shown => false)
	end

	def self.fire(user,bid,ntype)
		self.create(:user => user, :bid => bid, :ntype => ntype, :shown => false)
	end
end
