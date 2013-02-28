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

# Admin user
User.create(:username => "Administrator",
	:email => "admin@admin.de",
	:password => "admin5",
	:role_ids => [1,2],
	:photo => URI.parse("http://lorempixel.com/100/100/")).confirm!

# Categories
Category.create(:category_id => nil, :name => 'Web Development')
Category.create(:category_id => nil, :name => 'Mobile Devices')
Category.create(:category_id => nil, :name => 'Application Software')
Category.create(:category_id => 1, :name => 'Website (with CMS)')
Category.create(:category_id => 1, :name => 'Website (without CMS)')
Category.create(:category_id => 1, :name => 'SEO')
Category.create(:category_id => 1, :name => 'Facebook Fanpage')
Category.create(:category_id => 1, :name => 'Others')
Category.create(:category_id => 2, :name => 'iPhone/iPad')
Category.create(:category_id => 2, :name => 'Android')
Category.create(:category_id => 2, :name => 'Windows Phone')
Category.create(:category_id => 2, :name => 'Others')
Category.create(:category_id => 3, :name => 'Windows')
Category.create(:category_id => 3, :name => 'Mac')
Category.create(:category_id => 3, :name => 'Linux')
Category.create(:category_id => 3, :name => 'Others')