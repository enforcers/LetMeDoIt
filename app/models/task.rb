class Task < ActiveRecord::Base
  belongs_to :project
  has_many :bids

	validates :name,
		:presence => true
	validates :description,
		:presence => true
	validates :due_date,
		:presence => true
	validates :project_id,
		:presence => true
end
