class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.integer :total_seconds
      t.integer :project_id

      t.timestamps
    end
  end
end
