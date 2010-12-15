class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.string :path
      t.integer :owner_id

      t.timestamps
    end
    
    add_column :projects, :account_id, :integer
    add_index :projects, :account_id
  end

  def self.down
    drop_table :accounts
  end
end
