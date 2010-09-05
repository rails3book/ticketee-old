class AddPreviousStateIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :previous_state_id, :integer
  end

  def self.down
    remove_column :comments, :previous_state_id
  end
end