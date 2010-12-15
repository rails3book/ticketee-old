class CreateAccountUsers < ActiveRecord::Migration
  def self.up
    create_table :account_users do |t|
      t.integer :account_id
      t.integer :user_id
      t.boolean :admin, :default => false

      t.timestamps
    end
    
    remove_column :users, :admin
  end

  def self.down
    drop_table :account_users
  end
end
