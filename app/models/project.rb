class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :tasks

	validates :name,
		:presence => true
	validates :description,
		:presence => true
	validates :category_id,
		:presence => true

	def availableTasks
		# implement later, counts tasks which are not flagged as finished
		return 0
	end

	def is_owner(user)
		unless user.nil?
			return user.id == self.user_id
		end
	end
end