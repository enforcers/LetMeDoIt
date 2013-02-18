class RenameTypColumnInNotification < ActiveRecord::Migration
  def up
  	rename_column :notifications, :type, :ntype
  end

  def down
  	rename column :notifications, :ntype, :type
  end
end
