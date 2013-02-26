namespace :db do
	desc "Fill database with sample data"
	task :sample => :environment do
		require 'faker'
		make_users
		make_skills
		make_projects
		make_tasks
		make_bids
	end

	def make_users
		User.create(:username => "Administrator",
			:email => "admin@admin.de",
			:password => "admin5",
			:about_me => Faker::Lorem.sentence(10),
			:role_ids => [1,2],
			:photo => URI.parse("http://lorempixel.com/100/100/"))
		User.create(:username => "Mr. President",
			:email => "abraham@lincoln.de",
			:password => "lincoln",
			:about_me => Faker::Lorem.sentence(10),
			:role_ids => [1,2],
			:photo => URI.parse("http://lorempixel.com/100/100/"))
		User.create(:username => "Dentist",
			:email => "dr.king@schulz.de",
			:password => "schulz",
			:about_me => Faker::Lorem.sentence(10),
			:role_ids => [1,2],
			:photo => URI.parse("http://lorempixel.com/100/100/"))
		User.create(:username => "Pilgrim",
			:email => "seth@mcfarlane.de",
			:password => "mcfarlane",
			:about_me => Faker::Lorem.sentence(10),
			:role_ids => [1,2],
			:photo => URI.parse("http://lorempixel.com/100/100/"))
		User.create(:username => "Hans",
			:email => "hans@kanns.de",
			:password => "erkanns",
			:about_me => Faker::Lorem.sentence(10),
			:role_ids => [1,2],
			:photo => URI.parse("http://lorempixel.com/100/100/"))
		User.create(:username => "Jack",
			:email => "jack@johnson.de",
			:password => "johnson",
			:about_me => Faker::Lorem.sentence(10),
			:role_ids => [1,2],
			:photo => URI.parse("http://lorempixel.com/100/100/"))
		User.create(:username => "Bub",
			:email => "boeser@bub.de",
			:password => "ichkannalles",
			:about_me => Faker::Lorem.sentence(10),
			:role_ids => [1,2],
			:photo => URI.parse("http://lorempixel.com/100/100/"))
	end

	def make_skills(max_per_user = 3)
		User.all.each do |user|
			(1 + rand(max_per_user)).times do
				Skill.create(:user => user,
					:name => Faker::Lorem.word(1),
					:rating => 1 + rand(9))
			end
		end
	end

	def make_projects(max_per_user = 3)
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

	def make_bids(max_per_user = 5)
		User.all(:order => "RANDOM()").each do |user|
			rand(max_per_user).times do
				task = (Project.all - user.projects).sample.tasks.sample

				Bid.create(:user => user,
					:task => task,
					:amount => rand(task.budget),
					:comment => Faker::Lorem.paragraph)
			end
		end
	end
end