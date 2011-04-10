class AddTwitterFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :twitter_id, :string
    add_column :users, :twitter_screen_name, :string
    add_column :users, :twitter_display_name, :string
  end

  def self.down
    remove_column :users, :twitter_id
    remove_column :users, :twitter_screen_name
    remove_column :users, :twitter_display_name
  end
end
