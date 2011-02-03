class HoboMigration47 < ActiveRecord::Migration
  def self.up
    create_table :seasons do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_column :thresholds, :season_id, :integer
    remove_column :thresholds, :season

    add_index :thresholds, [:season_id]
  end

  def self.down
    remove_column :thresholds, :season_id
    add_column :thresholds, :season, :string

    drop_table :seasons

    remove_index :thresholds, :name => :index_thresholds_on_season_id rescue ActiveRecord::StatementInvalid
  end
end
