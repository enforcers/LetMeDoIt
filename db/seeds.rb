# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Role.create(:name => "Admin")
Role.create(:name => "Registered")
User.create(:email => 'admin@admin.de', :password => 'admin5', :role_ids => [1,2])
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