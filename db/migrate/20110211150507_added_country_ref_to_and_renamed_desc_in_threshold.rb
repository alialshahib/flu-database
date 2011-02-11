class AddedCountryRefToAndRenamedDescInThreshold < ActiveRecord::Migration
  def self.up
    rename_column :thresholds, :description_of_how_cuttoff_values_were_calculated, :description
    add_column :thresholds, :country_id, :integer

    add_index :thresholds, [:country_id]
  end

  def self.down
    rename_column :thresholds, :description, :description_of_how_cuttoff_values_were_calculated
    remove_column :thresholds, :country_id

    remove_index :thresholds, :name => :index_thresholds_on_country_id rescue ActiveRecord::StatementInvalid
  end
end
