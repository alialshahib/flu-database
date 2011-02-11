class AddUserCountryRelationship < ActiveRecord::Migration
  def self.up
    create_table :user_countries do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
      t.integer  :country_id
    end
    add_index :user_countries, [:user_id]
    add_index :user_countries, [:country_id]
  end

  def self.down
    drop_table :user_countries
  end
end
