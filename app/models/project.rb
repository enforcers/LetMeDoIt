class Project < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :tasks

	self.per_page = 10

	validates :name,
		:presence => true
	validates :description,
		:presence => true
	validates :category_id,
		:presence => true

	def available_tasks
		return self.tasks.where("due_date >= '#{DateTime.now.to_date}'").count
	end

	def is_owner(user)
		unless user.nil?
			return user.id == self.user_id
		end
	end
end