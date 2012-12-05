class AddDueDateToTask < ActiveRecord::Migration
  def change
	  change_table :tasks do |t|
	  t.date "due_date"
	end
  end
end
