class CreateRuns < ActiveRecord::Migration
  def self.up
    create_table :runs do |t|
      t.float :distance
      t.text :description
      t.integer :time_in_seconds
      t.integer :user_id
      t.date :ran_on

      t.timestamps
    end
  end

  def self.down
    drop_table :runs
  end
end
