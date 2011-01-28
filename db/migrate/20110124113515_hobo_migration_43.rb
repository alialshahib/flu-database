class HoboMigration43 < ActiveRecord::Migration
  def self.up
    create_table :thresholds do |t|
      t.string   :season
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :thresholds
  end
end
