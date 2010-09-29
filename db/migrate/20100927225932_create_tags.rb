class CreateTags < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string :name
    end

    create_table :tags_tickets, :id => false do |t|
      t.integer :tag_id, :ticket_id  
    end
  end

  def self.down
    drop_table :tags
    drop_table :tags_tickets
  end
end
