class RenameAboutmeField < ActiveRecord::Migration
  def up
  	rename_column :users, :aboutMe, :about_me
  end

  def down
  	rename_column :users, :about_me, :aboutMe
  end
end
