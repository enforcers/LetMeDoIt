class AddaboutMeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :aboutMe, :string
  end
end
