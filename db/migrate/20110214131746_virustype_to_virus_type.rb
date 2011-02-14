class VirustypeToVirusType < ActiveRecord::Migration
  def self.up
    create_table :virus_types do |t|
      t.string   :name
      t.text     :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :virus_types
  end
end
