class AddRequestCountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :request_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :request_count
  end
end
