class Skill < ActiveRecord::Base
	belongs_to :user

	validates :name,
		:presence => true
	validates :rating,
		:presence => true,
		:inclusion => 1..10

end
