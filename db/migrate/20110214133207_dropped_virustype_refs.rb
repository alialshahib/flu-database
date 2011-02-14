class DroppedVirustypeRefs < ActiveRecord::Migration
  def self.up
    drop_table :virustypes

    rename_column :thresholds, :virustype_id, :virus_type_id

    remove_index :thresholds, :name => :index_thresholds_on_virustype_id rescue ActiveRecord::StatementInvalid
    add_index :thresholds, [:virus_type_id]
  end

  def self.down
    rename_column :thresholds, :virus_type_id, :virustype_id

    create_table "virustypes", :force => true do |t|
      t.string   "name"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    remove_index :thresholds, :name => :index_thresholds_on_virus_type_id rescue ActiveRecord::StatementInvalid
    add_index :thresholds, [:virustype_id]
  end
end
