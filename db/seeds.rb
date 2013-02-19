# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# Roles
Role.create(:name => "Admin")
Role.create(:name => "Registered")

# Users
User.create(:id => 1, :username => 'Administrator', :email => 'admin@admin.de', :password => 'admin5', :role_ids => [1,2])
User.create(:id => 2, :username => 'Mr. President', :email => 'abraham@lincoln.de', :password => 'lincoln', :role_ids => [2])
User.create(:id => 3, :username => 'Dentist', :email => 'dr.king@schulz.de', :password => 'schulz', :role_ids => [2])
User.create(:id => 4, :username => 'Pilgrim', :email => 'seth@mcfarlane.de', :password => 'mcfarlane', :role_ids => [2])
User.create(:id => 5, :username => 'Hans', :email => 'hans@kanns.de', :password => 'erkanns', :role_ids => [2])
User.create(:id => 6, :username => 'Jack', :email => 'jack@johnson.de', :password => 'johnson', :role_ids => [2])
User.create(:id => 7, :username => 'Bub', :email => 'boeser@bub.de', :password => 'ichkannalles', :role_ids => [2])

# Categories
Category.create(:id => 1, :category_id => nil, :name => 'Web Development')
Category.create(:id => 2, :category_id => nil, :name => 'Mobile Devices')
Category.create(:id => 3, :category_id => nil, :name => 'Application Software')
Category.create(:id => 4, :category_id => 1, :name => 'Website (with CMS)')
Category.create(:id => 5, :category_id => 1, :name => 'Website (without CMS)')
Category.create(:id => 6, :category_id => 1, :name => 'SEO')
Category.create(:id => 7, :category_id => 1, :name => 'Facebook Fanpage')
Category.create(:id => 8, :category_id => 1, :name => 'Others')
Category.create(:id => 9, :category_id => 2, :name => 'iPhone/iPad')
Category.create(:id => 10, :category_id => 2, :name => 'Android')
Category.create(:id => 11, :category_id => 2, :name => 'Windows Phone')
Category.create(:id => 12, :category_id => 2, :name => 'Others')
Category.create(:id => 13, :category_id => 3, :name => 'Windows')
Category.create(:id => 14, :category_id => 3, :name => 'Mac')
Category.create(:id => 15, :category_id => 3, :name => 'Linux')
Category.create(:id => 16, :category_id => 3, :name => 'Others')

# Projects
Project.create(:id => 1, :name => 'Twitter 2.0', :description => 'Redefining Twitter ... bla bla.', :category_id => 1, :user_id => 2)
Project.create(:id => 2, :name => 'Facebook Fanpage', :description => 'Just a Fanpage for the Pilgrims.', :category_id => 7, :user_id => 4)
Project.create(:id => 3, :name => 'Dentist Website', :description => 'Hello, my name ist Dr. King Schulz and this is my horse Fritz. We need a Website ...', :category_id => 5, :user_id => 3)
Project.create(:id => 4, :name => 'Bild 2.0', :description => 'One more Website with bullshit content please.', :category_id => 5, :user_id => 4)
Project.create(:id => 5, :name => 'Pizza Service', :description => 'Website with CMS is needed.', :category_id => 4, :user_id => 4)
Project.create(:id => 6, :name => 'Roadhouse Website', :description => 'Website for our restaurant in Muenster.', :category_id => 5, :user_id => 3)
Project.create(:id => 7, :name => 'Facebook Fanpage', :description => 'Fanpage for my Grandpa.', :category_id => 7, :user_id => 2)
Project.create(:id => 8, :name => 'Youtube', :description => 'Youtube without GEMA restictions.', :category_id => 1, :user_id => 2)
Project.create(:id => 9, :name => 'Crysis 4', :description => 'Nothing else to say.', :category_id => 13, :user_id => 3)
Project.create(:id => 10, :name => 'Tetris - the rebirth', :description => 'Tetris needs to be polished.', :category_id => 10, :user_id => 5)
Project.create(:id => 11, :name => 'iOS Maps', :description => 'We need that very, very soon!', :category_id => 9, :user_id => 5)
Project.create(:id => 12, :name => 'Angry Birds', :description => 'We need more episodes!', :category_id => 9, :user_id => 4)
Project.create(:id => 13, :name => 'Windows Office 2018', :description => 'This time it will be great!', :category_id => 13, :user_id => 2)
Project.create(:id => 14, :name => 'Reeder', :description => 'RSS Reader for MAC', :category_id => 14, :user_id => 4)
Project.create(:id => 15, :name => 'Ruby on Rails Tutorial Website', :description => 'Website for Tutorials..', :category_id => 5, :user_id => 2)
Project.create(:id => 16, :name => 'Twilight Fanpage', :description => 'Thats for my girlfriend ...', :category_id => 5, :user_id => 5)

# Tasks
Task.create(:id => 1, :name => 'Design', :description => 'Complete layout.', :budget => 1000, :project_id => 1, :due_date => '2013-04-17')
Task.create(:id => 2, :name => 'Content', :description => 'Complete content.', :budget => 1300, :project_id => 1, :due_date => '2013-05-17')
Task.create(:id => 3, :name => 'Engine', :description => 'Complete new engine.', :budget => 19817, :project_id => 9, :due_date => '2015-06-06')
Task.create(:id => 4, :name => 'Design & Layout', :description => 'Complete layout', :budget => 722, :project_id => 5, :due_date => '2013-05-20')
Task.create(:id => 5, :name => 'Programming', :description => 'Complete programming', :budget => 99125, :project_id => 13, :due_date => '2018-02-10')
Task.create(:id => 6, :name => 'Programming', :description => 'Complete programming', :budget => 3500, :project_id => 14, :due_date => '2013-07-28')
Task.create(:id => 7, :name => 'Design & Layout', :description => 'Complete layout', :budget => 5000, :project_id => 14, :due_date => '2013-06-01')
Task.create(:id => 8, :name => 'Programming', :description => 'Complete programming', :budget => 10000, :project_id => 8, :due_date => '2014-03-10')
Task.create(:id => 9, :name => 'Design', :description => 'Complete ney layout', :budget => 1900, :project_id => 15, :due_date => '2013-03-07')
Task.create(:id => 10, :name => 'Content', :description => 'Complete content', :budget => 50, :project_id => 4, :due_date => '2013-05-01')
Task.create(:id => 11, :name => 'Content', :description => 'Complete content', :budget => 100, :project_id => 5, :due_date => '2013-08-10')
Task.create(:id => 12, :name => 'Design', :description => 'Complete layout', :budget => 790, :project_id => 16, :due_date => '2013-09-20')

# Bids
Bid.create(:id => 1, :task_id => 3, :user_id => 3, :amount => 25000, :comment => 'I need money')
Bid.create(:id => 2, :task_id => 3, :user_id => 6, :amount => 30000, :comment => 'I need money')
Bid.create(:id => 3, :task_id => 8, :user_id => 7, :amount => 15000, :comment => 'I need money')
Bid.create(:id => 4, :task_id => 7, :user_id => 6, :amount => 6500, :comment => 'I need money')
Bid.create(:id => 5, :task_id => 5, :user_id => 7, :amount => 100000, :comment => 'I need money')
Bid.create(:id => 6, :task_id => 11, :user_id => 2, :amount => 120, :comment => 'I need money')