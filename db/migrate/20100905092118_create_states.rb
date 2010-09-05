class CreateStates < ActiveRecord::Migration
  def self.up
    drop_table :states
    create_table :states do |t|
      t.string :name
    end

    add_column :tickets, :state_id, :integer
    add_index :tickets, :state_id

    add_column :comments, :state_id, :integer
  end

  def self.down
    drop_table :states
  end
end