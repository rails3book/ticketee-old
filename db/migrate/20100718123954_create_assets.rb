class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :asset_file_name
      t.integer :asset_file_size
      t.string :asset_content_type
      t.datetime :asset_updated_at
      t.string :object_type
      t.integer :object_id

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
