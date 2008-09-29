class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.integer :facebook_id,:limit=>20
      t.string :session_key
      t.timestamps
    end
    add_index "users", :facebook_id,:unique=>true
  end

  def self.down
    remove_index "users", :facebook_id
    drop_table :facebook_templates
  end
end
