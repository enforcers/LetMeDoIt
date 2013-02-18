class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user
      t.references :bid
      t.integer :type
      t.boolean :shown

      t.timestamps
    end
    add_index :notifications, :user_id
    add_index :notifications, :bid_id
  end
end
