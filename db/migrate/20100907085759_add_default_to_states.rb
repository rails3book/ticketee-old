class AddDefaultToStates < ActiveRecord::Migration
  def self.up
    add_column :states, :default, :boolean, :default => false
  end

  def self.down
    remove_column :states, :default
  end
end
