class AddUserIdToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :user_id, :integer
  end

  def self.down
    remove_column :tickets, :user_id
  end
end
