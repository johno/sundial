class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :task_id

      t.timestamps
    end
  end
end
