class HoboMigration45 < ActiveRecord::Migration
  def self.up
    add_column :thresholds, :description_of_how_cuttoff_values_were_calculated, :text
  end

  def self.down
    remove_column :thresholds, :description_of_how_cuttoff_values_were_calculated
  end
end
