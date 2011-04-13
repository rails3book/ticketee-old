class AddGithubFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :github_id, :integer
    add_column :users, :github_user_name, :string
    add_column :users, :github_display_name, :string
  end

  def self.down
    remove_column :users, :github_id
    remove_column :users, :github_user_name
    remove_column :users, :github_display_name
  end
end
