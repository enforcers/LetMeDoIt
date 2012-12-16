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
	validates :project_id,
		:presence => true
end
