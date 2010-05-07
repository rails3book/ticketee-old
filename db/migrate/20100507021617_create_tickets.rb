class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.references :project

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
