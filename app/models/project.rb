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
		return self.tasks.where("due_date >= ? and bid_id IS NULL",DateTime.now.to_date).count
	end

	def is_owner(user)
		unless user.nil?
			return user.id == self.user_id
		end
	end

	def self.get_active
		@active = Array.new

		Project.all.each do |project|
			project.tasks.each do |task|
				if task.due_date >= DateTime.now
					@active << project
					break
				end
			end
		end
		#@active = Project.joins("inner join tasks on tasks.project_id = project.id where tasks.bid_id IS NULL and tasks.due_date >= ?",DateTime.now.to_date)
		return @active
	end

	def to_param
		"#{id}-#{name.parameterize}"
	end
end