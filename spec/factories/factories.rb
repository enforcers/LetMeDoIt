require 'faker'
require 'factory_girl'

FactoryGirl.define do
	factory :user do 
		email {Faker::Internet.email}
		username Faker::Name.name
		password "secret"
		role_ids [1]
	end

	factory :project do 
		name Faker::Name.name
		description Faker::Lorem.paragraphs(3)
		user_id :user
		category_id 1
	end

	factory :task do 
		name Faker::Name.name
		description Faker::Lorem.paragraphs(3)
		budget 2500
		project_id :project_id
		due_date Date.tomorrow()
	end

	factory :bid do
		task_id :task
		user_id :user
		amount 500
		comment Faker::Lorem.paragraphs(3)
	end

	factory :category do
		category_id  nil
		name Faker::Lorem.word
	end
end