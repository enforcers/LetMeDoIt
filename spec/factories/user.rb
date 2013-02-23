require 'faker'

FactoryGirl.define do 
	factory :user do |f|
		f.email Faker::Internet.email
		f.username Faker::Name.name
		f.password "secret"
		f.role_ids [1]
	end
end