class AddProjectIdIndexToTickets < ActiveRecord::Migration
  def self.up
    add_index :tickets, :project_id
  end

  def self.down
    remove_index :tickets, :project_id
  end
end
