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
Project.create(:id => 1, :name => 'Twilight Fanpage', :description => 'Thats for my girlfriend ...', :category_id => 5, :user_id => 5)
Task.create(:id => 1, :name => 'Design', :description => 'Complete layout', :budget => 790, :project_id => 1, :due_date => '2013-09-20')

Project.create(:id => 2, :name => 'Facebook Fanpage', :description => 'Just a Fanpage for the Pilgrims.', :category_id => 7, :user_id => 1)
Task.create(:id => 2, :name => 'Programming', :description => 'Complete programming', :budget => 10000, :project_id => 2, :due_date => '2014-03-10')
Bid.create(:id => 1, :task_id => 2, :user_id => 5, :amount => 5500, :comment => 'I need money')
Bid.create(:id => 2, :task_id => 2, :user_id => 6, :amount => 6500, :comment => 'I need money')
Notification.create(:user_id => 1, :bid_id => 1, :ntype => 1, :shown => false)
Notification.create(:user_id => 1, :bid_id => 2, :ntype => 1, :shown => false)

Project.create(:id => 3, :name => 'Dentist Website', :description => 'Hello, my name ist Dr. King Schulz and this is my horse Fritz. We need a Website ...', :category_id => 5, :user_id => 3)
Task.create(:id => 3, :name => 'Layout/Design', :description => 'Complete layout/design', :budget => 1500, :project_id => 3, :due_date => '2014-03-10')
Task.create(:id => 4, :name => 'Programming logic (Perl)', :description => 'Complete programming', :budget => 2000, :project_id => 3, :due_date => '2014-03-10')
Bid.create(:id => 3, :task_id => 3, :user_id => 1, :amount => 1500, :comment => 'I need money')
Bid.create(:id => 4, :task_id => 3, :user_id => 5, :amount => 1300, :comment => 'I need money')
Bid.create(:id => 5, :task_id => 3, :user_id => 7, :amount => 700, :comment => 'I need money')
Notification.create(:user_id => 3, :bid_id => 3, :ntype => 1, :shown => false)
Notification.create(:user_id => 3, :bid_id => 4, :ntype => 1, :shown => false)
Notification.create(:user_id => 3, :bid_id => 5, :ntype => 1, :shown => false)

Project.create(:id => 4, :name => 'Bild 2.0', :description => 'One more Website with bullshit content please.', :category_id => 5, :user_id => 4)
Task.create(:id => 5, :name => 'Content', :description => 'Complete content', :budget => 50, :project_id => 4, :due_date => '2013-05-01')
Bid.create(:id => 6, :task_id => 5, :user_id => 3, :amount => 50, :comment => 'I need money')
Notification.create(:user_id => 4, :bid_id => 6, :ntype => 1, :shown => false)

Project.create(:id => 5, :name => 'Pizza Service', :description => 'Website with CMS is needed.', :category_id => 4, :user_id => 4)
Task.create(:id => 6, :name => 'Design & Layout', :description => 'Complete layout', :budget => 722, :project_id => 5, :due_date => '2013-05-20')
Task.create(:id => 7, :name => 'Content', :description => 'Complete content', :budget => 100, :project_id => 5, :due_date => '2013-08-10')

Project.create(:id => 6, :name => 'Roadhouse Website', :description => 'Website for our restaurant in Muenster.', :category_id => 5, :user_id => 3)
Task.create(:id => 8, :name => 'Layout/Design', :description => 'Complete layout/design', :budget => 2500, :project_id => 6, :due_date => '2013-04-10')
Task.create(:id => 9, :name => 'Programming logic (PHP)', :description => 'Complete programming', :budget => 4000, :project_id => 6, :due_date => '2013-04-10')
Bid.create(:id => 7, :task_id => 8, :user_id => 1, :amount => 1800, :comment => 'I need money')
Bid.create(:id => 8, :task_id => 8, :user_id => 2, :amount => 2500, :comment => 'I need money')
Notification.create(:user_id => 3, :bid_id => 7, :ntype => 1, :shown => false)
Notification.create(:user_id => 3, :bid_id => 8, :ntype => 1, :shown => false)

Project.create(:id => 7, :name => 'Facebook Fanpage', :description => 'Fanpage for my Grandpa.', :category_id => 7, :user_id => 2)
Task.create(:id => 10, :name => 'Create Facebook site', :description => 'It should be...', :budget => 500, :project_id => 7, :due_date => '2013-05-01')

Project.create(:id => 8, :name => 'Youtube', :description => 'Youtube without GEMA restictions.', :category_id => 1, :user_id => 2)

Project.create(:id => 9, :name => 'Crysis 4', :description => 'Nothing else to say.', :category_id => 13, :user_id => 3)
Task.create(:id => 11, :name => 'Engine modelling', :description => 'Complete engine', :budget => 25000, :project_id => 9, :due_date => '2015-04-10')
Task.create(:id => 12, :name => 'Graphics', :description => 'Complete graphics', :budget => 180000, :project_id => 9, :due_date => '2017-04-10')
Bid.create(:id => 9, :task_id => 12, :user_id => 5, :amount => 17000, :comment => 'I need money')
Bid.create(:id => 10, :task_id => 12, :user_id => 7, :amount => 22000, :comment => 'I need money')
Notification.create(:user_id => 3, :bid_id => 9, :ntype => 1, :shown => false)
Notification.create(:user_id => 3, :bid_id => 10, :ntype => 1, :shown => false)

Project.create(:id => 10, :name => 'Tetris - the rebirth', :description => 'Tetris needs to be polished.', :category_id => 10, :user_id => 5)
Project.create(:id => 11, :name => 'iOS Maps', :description => 'We need that very, very soon!', :category_id => 9, :user_id => 5)
Project.create(:id => 12, :name => 'Angry Birds', :description => 'We need more episodes!', :category_id => 9, :user_id => 4)

Project.create(:id => 13, :name => 'Windows Office 2018', :description => 'This time it will be great!', :category_id => 13, :user_id => 2)
Task.create(:id => 13, :name => 'Programming', :description => 'Complete programming', :budget => 99125, :project_id => 13, :due_date => '2018-02-10')
Bid.create(:id => 11, :task_id => 13, :user_id => 1, :amount => 25000, :comment => 'I need money')
Notification.create(:user_id => 2, :bid_id => 11, :ntype => 1, :shown => false)

Project.create(:id => 14, :name => 'Reeder', :description => 'RSS Reader for MAC', :category_id => 14, :user_id => 4)
Task.create(:id => 14, :name => 'Programming', :description => 'Complete programming', :budget => 3500, :project_id => 14, :due_date => '2013-07-28')
Task.create(:id => 15, :name => 'Design & Layout', :description => 'Complete layout', :budget => 5000, :project_id => 14, :due_date => '2013-06-01')
Bid.create(:id => 12, :task_id => 14, :user_id => 5, :amount => 2500, :comment => 'I need money')
Notification.create(:user_id => 4, :bid_id => 12, :ntype => 1, :shown => false)

Project.create(:id => 15, :name => 'Ruby on Rails Tutorial Website', :description => 'Website for Tutorials..', :category_id => 5, :user_id => 2)
Task.create(:id => 16, :name => 'Design', :description => 'Complete ney layout', :budget => 1900, :project_id => 15, :due_date => '2013-03-07')
Bid.create(:id => 13, :task_id => 16, :user_id => 1, :amount => 1400, :comment => 'I need money')
Bid.create(:id => 14, :task_id => 16, :user_id => 3, :amount => 1750, :comment => 'I need money')
Bid.create(:id => 15, :task_id => 16, :user_id => 4, :amount => 1900, :comment => 'I need money')
Notification.create(:user_id => 2, :bid_id => 13, :ntype => 1, :shown => false)
Notification.create(:user_id => 2, :bid_id => 14, :ntype => 1, :shown => false)
Notification.create(:user_id => 2, :bid_id => 15, :ntype => 1, :shown => false)

Project.create(:id => 16, :name => 'Twitter 2.0', :description => 'Redefining Twitter ... bla bla.', :category_id => 1, :user_id => 2)
Task.create(:id => 17, :name => 'Design', :description => 'Complete layout.', :budget => 1000, :project_id => 16, :due_date => '2013-04-17', :bid_id => 2)
Task.create(:id => 18, :name => 'Content', :description => 'Complete content.', :budget => 1300, :project_id => 16, :due_date => '2013-05-17')
Task.create(:id => 19, :name => 'Engine', :description => 'Complete new engine.', :budget => 19817, :project_id => 16, :due_date => '2015-06-06')
Bid.create(:id => 16, :task_id => 17, :user_id => 1, :amount => 900, :comment => 'I need money')
Bid.create(:id => 17, :task_id => 17, :user_id => 3, :amount => 590, :comment => 'I need money')
Bid.create(:id => 18, :task_id => 17, :user_id => 4, :amount => 1000, :comment => 'I need money')
Bid.create(:id => 19, :task_id => 18, :user_id => 1, :amount => 600, :comment => 'I need money')
Notification.create(:user_id => 2, :bid_id => 16, :ntype => 1, :shown => false)
Notification.create(:user_id => 2, :bid_id => 17, :ntype => 1, :shown => false)
Notification.create(:user_id => 2, :bid_id => 18, :ntype => 1, :shown => false)
Notification.create(:user_id => 2, :bid_id => 19, :ntype => 1, :shown => false)
Notification.create(:user_id => 1, :bid_id => 16, :ntype => 3, :shown => false)
Notification.create(:user_id => 3, :bid_id => 17, :ntype => 2, :shown => false)
Notification.create(:user_id => 4, :bid_id => 18, :ntype => 3, :shown => false)