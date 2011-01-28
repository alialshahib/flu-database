class HoboMigration26 < ActiveRecord::Migration
  def self.up
    add_column :sequences, :isd_number, :string
    add_column :sequences, :aa_resistance_mutations, :string
    add_column :sequences, :na_sequence, :string
    add_column :sequences, :ha_sequence, :string
    add_column :sequences, :m2_sequence, :string
    add_column :sequences, :comment, :text
    remove_column :sequences, :gene
    remove_column :sequences, :accession
    remove_column :sequences, :susp
  end

  def self.down
    remove_column :sequences, :isd_number
    remove_column :sequences, :aa_resistance_mutations
    remove_column :sequences, :na_sequence
    remove_column :sequences, :ha_sequence
    remove_column :sequences, :m2_sequence
    remove_column :sequences, :comment
    add_column :sequences, :gene, :string
    add_column :sequences, :accession, :string
    add_column :sequences, :susp, :integer
  end
end
