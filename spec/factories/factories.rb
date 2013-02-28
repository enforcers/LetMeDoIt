require 'faker'
require 'factory_girl'

FactoryGirl.define do
	factory :user do 
		email {Faker::Internet.email}
		username Faker::Name.name
		password "secret"
		role_ids [1]
		after(:create) { |user| user.confirm! }
	end

	factory :project do 
		name Faker::Name.name
		description Faker::Lorem.paragraphs(3)
		user
		category_id 1
	end

	factory :task do 
		name Faker::Name.name
		description Faker::Lorem.paragraphs(3)
		budget 2500.00
		project
		due_date Date.tomorrow()
	end

	factory :bid do
		amount 1500.00
		task
		user
		comment Faker::Lorem.paragraphs(3)
	end
end