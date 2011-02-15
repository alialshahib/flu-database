class AddedToolsTable < ActiveRecord::Migration
  def self.up
    create_table :tools do |t|
      t.string   :title
      t.text     :description
      t.text     :parameters
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :tools
  end
end
