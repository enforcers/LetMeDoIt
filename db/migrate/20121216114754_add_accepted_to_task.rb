class AddAcceptedToTask < ActiveRecord::Migration
	def change
		change_table :tasks do |t|
			t.references :bid
		end
	end
end