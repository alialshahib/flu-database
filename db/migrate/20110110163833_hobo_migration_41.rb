class HoboMigration41 < ActiveRecord::Migration
  def self.up
    remove_column :sequences, :isd_number
    remove_column :sequences, :aa_resistance_mutations
  end

  def self.down
    add_column :sequences, :isd_number, :string
    add_column :sequences, :aa_resistance_mutations, :string
  end
end
