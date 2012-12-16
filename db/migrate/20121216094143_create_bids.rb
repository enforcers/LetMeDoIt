class CreateBids < ActiveRecord::Migration
  def up
  	create_table :bids do |t|
  		t.references :task
  		t.references :user
  		t.decimal :amount
  		t.text :comment

  		t.timestamps
  	end
  end

  def down
  end
end
