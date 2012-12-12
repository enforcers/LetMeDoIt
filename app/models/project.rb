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
end