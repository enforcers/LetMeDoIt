class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.references :user
      t.references :category

      t.timestamps
    end
    add_index :projects, :user_id
    add_index :projects, :category_id
  end
end
