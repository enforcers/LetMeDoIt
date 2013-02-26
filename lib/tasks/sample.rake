namespace :db do
	desc "Fill database with sample data"
	task :sample => :environment do
		require 'faker'

		puts "Creating users..."
		make_users

		puts "Creating skills..."
		make_skills

		puts "Creating projects..."
		make_projects

		puts "Creating tasks..."
		make_tasks

		puts "Creating bids..."
		make_bids

		puts "Accepting bids..."
		accept_bids

		puts "Finished."
	end

	def make_users
		["Abraham", "Dentist", "Pilgrim", "Hans", "Jack", "Bub"].each do |name|
			User.create(:username => name,
				:email => name.downcase + "@example.org",
				:password => "password",
				:about_me => Faker::Lorem.sentence(10),
				:role_ids => [2],
				:photo => URI.parse("http://lorempixel.com/100/100/"))
		end
	end

	def make_skills(max_per_user = 3)
		User.all.each do |user|
			(1 + rand(max_per_user)).times do
				Skill.create(:user => user,
					:name => Faker::Name.title,
					:rating => 1 + rand(9))
			end
		end
	end

	def make_projects(max_per_user = 5)
		User.all(:order => "RANDOM()").each do |user|
			rand(max_per_user).times do
				Project.create(:name => Faker::Lorem.sentence(1),
					:description => Faker::Lorem.paragraph(20),
					:category => Category.where(:category_id => nil).sample,
					:user => user)
			end
		end
	end

	def make_tasks(max_per_project = 3)
		User.all(:order => "RANDOM()").each do |user|
			user.projects.each do |project|
				(1 + rand(max_per_project)).times do
					Task.create(:name => Faker::Lorem.sentence(1),
						:description => Faker::Lorem.paragraph(20),
						:budget => (1 + rand(19)) * 1000,
						:project => project,
						:due_date => Date.today + rand(10000))
				end
			end
		end
	end

	def make_bids(max_per_user = 10)
		User.all(:order => "RANDOM()").each do |user|
			rand(max_per_user).times do
				task = (Project.all - user.projects).sample.tasks.sample

				#if task.get_bid_for(user).blank?
					Bid.create(:user => user,
						:task => task,
						:amount => rand(task.budget),
						:comment => Faker::Lorem.paragraph)
				#end
			end
		end
	end

	def accept_bids
		Task.all.each do |task|
			if rand(2) > 0
				unless (sample_bid = task.bids.sample).nil?
					task.accepted = sample_bid.id
					task.save
				end
			end
		end
	end
end