class AddedThresholdEntryCollection < ActiveRecord::Migration
  def self.up
    add_column :thresholdentries, :threshold_id, :integer
    add_column :thresholdentries, :drug_id, :integer

    add_index :thresholdentries, [:threshold_id]
    add_index :thresholdentries, [:drug_id]
  end

  def self.down
    remove_column :thresholdentries, :threshold_id
    remove_column :thresholdentries, :drug_id

    remove_index :thresholdentries, :name => :index_thresholdentries_on_threshold_id rescue ActiveRecord::StatementInvalid
    remove_index :thresholdentries, :name => :index_thresholdentries_on_drug_id rescue ActiveRecord::StatementInvalid
  end
end
