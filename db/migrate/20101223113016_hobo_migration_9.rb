class HoboMigration9 < ActiveRecord::Migration
  def self.up
    add_column :suseptibilities, :country, :string
    remove_column :suseptibilities, :country_id

    remove_index :suseptibilities, :name => :index_suseptibilities_on_country_id rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :suseptibilities, :country
    add_column :suseptibilities, :country_id, :integer

    add_index :suseptibilities, [:country_id]
  end
end
