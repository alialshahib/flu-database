class AddedVirusType < ActiveRecord::Migration
  def self.up
    create_table :virustypes do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :virustypes
  end
end
