class CreateTicketWatchersTable < ActiveRecord::Migration
  def self.up
    create_table :ticket_watchers, :id => false do |t|
      t.integer :user_id, :ticket_id
    end
  end

  def self.down
    drop_table :ticket_watchers
  end
end
