class Project < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	has_many :tasks
	scope :no_tasks, includes(:tasks).where(:tasks => { :project_id => nil })


	accepts_nested_attributes_for :tasks

	accepts_nested_attributes_for :tasks

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
		return @active
	end

	def to_param
		"#{id}-#{name.parameterize}"
	end
end