class Skill < ActiveRecord::Base
	attr_accessible :name, :rating, :user_id
	belongs_to :user

	validates :name,
		:presence => true
	validates :rating,
		:presence => true,
		:inclusion => 1..10

end
