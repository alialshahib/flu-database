class HoboMigration44 < ActiveRecord::Migration
  def self.up
    add_column :thresholds, :virus_type, :string
  end

  def self.down
    remove_column :thresholds, :virus_type
  end
end
